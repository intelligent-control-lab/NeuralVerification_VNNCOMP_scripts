TOOL_NAME=NeuralVerification
VERSION_STRING=v1

# check arguments
if [ "$1" != ${VERSION_STRING} ]; then
	echo "Expected first argument (version string) '$VERSION_STRING', got '$1'"
	exit 1
fi

CATEGORY=$2
ONNX_FILE=$3
VNNLIB_FILE=$4

echo "Preparing $TOOL_NAME for benchmark instance in category '$CATEGORY' with onnx file '$ONNX_FILE' and vnnlib file '$VNNLIB_FILE'"

# kill any zombie processes
killall -q julia

# script returns a 0 exit code if successful. If you want to skip a benchmark category you can return non-zero.
yes n | gzip -kd "$ONNX_FILE"

julia prepare_instance.jl "$ONNX_FILE"
exit 0