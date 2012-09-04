# Note: AUTOBUILD_DIR is magically defined to be the directory where this
# file resides.

# Which stack to mirror and where
STACK_FROM="/lsst/DC3/stacks/gcc445-RH6/default/"
STACK_TO="/lsst/DC3/stacks/clang-30-RH6/"

BLACKLIST=(ctrl_orca ctrl_events datarel)

# Set up clang compiler environment
export PATH="/opt/llvm/3.0/bin:$PATH"
export CC=clang
export CXX=clang++
export NCORES=$((sysctl -n hw.ncpu || (test -r /proc/cpuinfo && grep processor /proc/cpuinfo | wc -l) || echo 2) 2>/dev/null)
export MAKEFLAGS="-j $NCORES"
export SCONSFLAGS="-j $NCORES cc=clang"
