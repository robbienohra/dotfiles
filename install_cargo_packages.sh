FILE="cargo_packages"


while read -r line; do
	package_name="$line"
	echo "Installing $package_name..."
	cargo install "$package_name"
done <"$FILE"
