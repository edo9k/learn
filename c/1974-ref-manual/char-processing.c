
# define nwords 100                 /* number of different words */
# define wsize 20                   /* max chars per word */
struct tnode {
  char tword[wsize];
  int count;
  struct tnode *left;
  struct tnode *right;
};

struct tnode space[nwords];          /* the words themselves */
int nnodes nwords;                  /* number of remaining slots */
struct tnode *spacep space;         /* next available slot */
struct tnode *freep;                /* free list */
/*
 * the main routine reads words until end-of-file ('\0' returned from "getchar")
 * "tree" is called to sort each word into the tree.
 */
main()
{
  struct tnode *top, *tree();
  char c, word[wsize];
  i = top = 0;
  while (c = getchar())
    if ('a' <= c && c <= 'z' || 'A' <= c && c <= 'Z') {
      if (i <= wsize-1)
        word[i++] = c;
    } else 
        if (i) {
          word[i++] = '\0';
          top = tree(top, word);
          i = 0;
        }
  tprint(top);
}
/*
 * The central routine. If the subtree pointer is null, allocate a new nod for it.
 * If the new word and the node's word are the same, increase the node's count.
 * Otherwise, recursively sort the word into the left or the right substree according
 * as the argument word is less or greater than the node's word.
 */
struct tnode *tree(p, word)
struct tnode *p;
char word[];
{
  struct tnode *alloc();
  int cond;
  
  /* is pointer null? */
  if (p==0) {
    p = alloc();
    copy(word, p->tword);
    p->count = 1;
    p->right = p->left = 0;
    return(p);
  }
  /* is word repeated? */
  if ((cond=compar(p->tword, word)) == 0) {
    p->count++;
    return(p);
  }
  /* sort into left or right */
  if (cond<0)
    p->left = tree(p->left, word);
  else
    p->right = tree(p->right, word);
  return(p);
}
/*
 * Print the tree by printing the left subtree, the given node, and the right subtree.
 */
tprint(p)
struct tnode *p;
{
  while (p) {
    tprint(p->left);
    printf("%d: %s\n", p->count, p->tword);
    p = p->right;
  }
}
/*
 * String comparison: return number (>, =, <) 0
 * according as s. (>, =, <) ?
 */
compar(s1, s2)
char *s1, *s2
{
  inc c1, c2;
  while((c1 = *s1++) == (c2 = *s2++))
    if(c1=='\0')
      return(0);
  return(c2-c1);
}
/*
 * String copy: copy s1 into s2 until the null
 * character appears.
 */
copy(s1, s2)
char *s1, *s2;
{
  while (*s2++ = *s1++);
}
/* 
 * Node allocation: return pointer to a free node.
 * Bomb out when all are gone. Just for fun, there
 * is a mechanism for using nodes that have been
 * freed, even though no one here calls "free".
 */
struct tnode *alloc()
{
  struct tnode 8t;
  if (freep) {
    t = freep;
    freep = freep->left;
    return(t);
  }
  if (--nodes < 0) {
    printf("Out of space\n");
    exit();
  }
  return(spacep++);
}
/*
 * The uncalled routine which puts a node on the free list.
 */
free(p)
struct tnode *p;
{
  p->left = freep;
  freep = p;
}


