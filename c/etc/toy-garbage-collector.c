#include <stdio.h>
#include <stdlib.h>

/*
 * toy garbage collector from Bob Nystrom's tutorial.
 *
 * Tutorial page: http://journal.stuffwithstuff.com/2013/12/08/babys-first-garbage-collector/
 * Github page: https://github.com/munificent/mark-sweep/
 *
 */

#define STACK_MAX 256
#define INIT_OBJ_NUM_MAX 8

typedef enum {
	OBJ_INT,
	OBJ_PAIR
} ObjectType;

typedef struct sObject {

	struct sObject* next;	

	unsigned char marked;

	ObjectType type;

	union {
		int value;

		struct {
			struct sObject* head;
			struct sObject* tail;
		};
	};
} Object;



typedef struct {
	Object* firstObject;
	Object* stack[STACK_MAX];
	int stackSize;
	int numObjects;
	int maxObjects;
} VM;

void assert(int condition, const char* message) {
	if (!condition) {
		printf("%s\n", message);
		exit(1);
	}
}


VM* newVM() {
	VM* vm = malloc(sizeof(VM));
	vm->stackSize = 0;
	vm->firstObject = NULL;
	vm->numObjects = 0;
	vm->maxObjects = INIT_OBJ_NUM_MAX;

	return vm;
}

void push(VM* vm, Object* value) {
	assert(vm->stackSize < STACK_MAX, "Stack overflow!");
	vm->stack[vm->stackSize++] = value;
}

Object* pop(VM* vm) {
	assert(vm->stackSize > 0, "Stack underflow!");
	return vm->stack[--vm->stackSize];
}

void mark(Object* object) {

	if (object->marked) return;

	object->marked = 1;

	if(object->type == OBJ_PAIR) {
		mark(object->head);
		mark(object->tail);
	}	
}

void markAll(VM* vm) {
	for (int i = 0; i < vm->stackSize; i++) {
		mark(vm->stack[i]);
	}
}

void sweep(VM* vm) {
	Object** object = &vm->firstObject;

	while(*object) {
		if(!(*object)->marked) {
			Object* unreached = *object;
		
			*object = unreached->next;
			free(unreached);

			vm->numObjects--;
		}
	}
}

void gc(VM* vm) {
	int numObjects = vm->numObjects;

	markAll(vm);
	sweep(vm);
	
	vm->maxObjects = vm->numObjects == 0 ? INIT_OBJ_NUM_MAX : vm->numObjects * 2;

	printf("Collected %d objects, %d remaining.\n",
		numObjects - vm->numObjects,
		vm->numObjects);
}


Object* newObject(VM* vm, ObjectType type) {
	if (vm->numObjects == vm->maxObjects) gc(vm);

	Object* object = malloc(sizeof(Object));
	object->type = type;
	object->next = vm->firstObject;
	vm->firstObject = object;
	object->marked = 0;

	vm->numObjects++;

	return object;
}


void pushInt(VM* vm, int intValue) {
	Object* object = newObject(vm, OBJ_INT);
	object->value = intValue;
	push(vm, object);
}

Object* pushPair(VM* vm) {
	Object* object = newObject(vm, OBJ_PAIR);
	object->tail = pop(vm);
	object->head = pop(vm);

	push(vm, object);
	return object;
}

void objectPrint(Object* object) {
	switch(object->type) {
		case OBJ_INT:
			printf("%d", object->value);
			break;

		case OBJ_PAIR:
			printf("(");
			objectPrint(object->head);
			printf(", ");
			objectPrint(object->tail);
			printf(") ");
			break;
	}
}

void freeVM(VM* vm) {
	vm->stackSize = 0;
	gc(vm);
	free(vm);
}

void test1() {
	printf("Test 1: Objects on stack are preserved.\n");
	VM* vm = newVM();
	pushInt(vm, 1);
	pushInt(vm, 2);

	gc(vm);
	assert(vm->numObjects == 2, "Should have preserved objects.");
	freeVM(vm);
}

int main(int argc, const char * argv[]) {
	test1();

	return 0;
}

