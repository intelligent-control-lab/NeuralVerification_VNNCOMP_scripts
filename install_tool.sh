sudo apt update -y
sudo apt wget -y
wget https://julialang-s3.julialang.org/bin/linux/x64/1.6/julia-1.6.1-linux-x86_64.tar.gz
tar -xvzf julia-1.6.1-linux-x86_64.tar.gz
sudo cp -r julia-1.6.1 /opt/
sudo ln -s /opt/julia-1.6.0/bin/julia /usr/local/bin/julia
sudo apt install build-essential -y
sudo apt install git -y

echo '
using Pkg
Pkg.add(url="https://github.com/sisl/NeuralVerification.jl")
Pkg.add("PyCall")
' | julia

git clone https://github.com/intelligent-control-lab/NeuralVerification_VNNCOMP_scripts.git
chmod +x NeuralVerification_VNNCOMP_scripts/*.sh
