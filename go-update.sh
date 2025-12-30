go install github.com/jesseduffield/lazydocker@latest
go install github.com/codesenberg/bombardier@latest
go install github.com/wagoodman/dive@latest
# go install github.com/julien040/anyquery@latest
go install github.com/bastengao/gncdu@latest
go install github.com/ajayd-san/gomanagedocker@main
go install github.com/jesseduffield/lazygit@latest
# curl -fsSL https://raw.githubusercontent.com/GianlucaP106/mynav/main/install.bash | bash
go install -v github.com/ogen-go/ogen/cmd/ogen@latest
go install google.golang.org/protobuf/cmd/protoc-gen-go@latest
go install google.golang.org/grpc/cmd/protoc-gen-go-grpc@latest

sudo curl -L https://github.com/bcicen/ctop/releases/download/v0.7.7/ctop-0.7.7-linux-amd64 -o /usr/local/bin/ctop ; sudo chmod +x /usr/local/bin/ctop
