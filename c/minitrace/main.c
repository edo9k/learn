/*
 * minimal 'strace' program, in less than 100 lines of C
 *
 * from the tutorial at:
 * blog.nel
 */

#include <sys/ptrace.h>
#include <bits/types.h>
#include <sys/user.h>
#include <sys/wait.h>
#include <sys/types.h>
#include <unistd.h>
#include <stdlib.h>
#include <stdio.h>
#include <errno.h>
#include <assert.h>
#include <string.h>

#include "syscalls.h"
#include "syscallents.h"

/* read sycall number / return value */
#ifdef __amd64__
#define eax rax
#define orig_eax orig_rax
#else 
#endif

#define offsetof(a, b) __builtin_offsetof(a, b)
#define get_reg(child, name) __get_reg(child, offsetof(struct user, regs.name))


int do_child(int argc, char **argv);
int do_trace(pid_t child);

int main(int argc, char **argv) {
  if (argc < 2) {
    fprintf(stderr, "Usage: %s <program to inspect> <args>\n", argv[0]);
    exit(1);
  }

  pid_t child = fork();
  if (child == 0) {
    return do_child(argc-1, argv+1);
  } else {
    return do_trace(child);
  }
}

int do_child(int argc, char **argv) {
  char *args [argc+1];
  memcpy(args, argv, argc * sizeof(char*));
  args[argc] = NULL;

  ptrace(PTRACE_TRACEME);
  kill(getpid(), SIGSTOP);
  return execvp(args[0], args);
}

int wait_for_syscall(pid_t child);

int do_trace(pid_t child) {
  int status, syscall, retval;

  waitpid(child, &status, 0);
  ptrace(PTRACE_SETOPTIONS, child, 0, PTRACE_O_TRACESYSGOOD);
  
  while(1) {
    if (wait_for_syscall(child) != 0) break;

    syscall = ptrace(PTRACE_PEEKUSER, child, sizeof(long) * ORIG_EAX);
    fprint(stderr, "syscall(%d) = ", syscall);

    if (wait_for_syscall(child) != 0) break;

    retval = ptrace(PTRACE_PEEKUSER, child, sizeof(long) * EAX);
    fprint(stderr, "%d\n", retval);
  }

  return 0;
}

int wait_for_syscall(pid_t child) {
  int status;

  while(1) {
    ptrace(PTRACE_SYSCALL, child, 0, 0);
    waitpid(child, &status, 0);
    if (WIFSTOPPED(status) && WSTOPSIG(status) & 0x80)
      return 0;
    if (WIFEXITED(status))
      return 1;
  }
}

