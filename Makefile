# Convenience wrapper: the actual Pintos build runs inside src/threads.
THREADS_DIR = src/threads
BUILD_DIR = $(THREADS_DIR)/build

TESTS = alarm-single \
	alarm-multiple \
	alarm-simultaneous \
	alarm-zero \
	alarm-negative

.PHONY: all clean test

all:
	$(MAKE) -C $(THREADS_DIR)

clean:
	$(MAKE) -C $(THREADS_DIR) clean

test: all
	@set -e; \
	for test in $(TESTS); do \
		echo "===== $$test ====="; \
		(cd $(BUILD_DIR) && pintos -- -q run $$test); \
	done