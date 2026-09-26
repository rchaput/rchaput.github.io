################
# Basic commands
################

# Run dev server
dev:
	hugo serve

# Build the website as a static bundle
build:
	hugo build --printI18nWarnings --minify

# Remove the built website
clean:
	rm -r public/


#############
# Maintenance
#############

# Update the Blowfish theme
update-blowfish:
	git submodule update --remote --merge


#############
# TailwindCSS
#############
BLOWFISH = ./themes/blowfish

# Install the Blowfish dependencies, which is required to compile the Tailwind CSS
install-blowfish-deps:
	cd $(BLOWFISH) && npm install

# Compile the Tailwind CSS from both our code and Blowfish's code into a one-file asset
compile-tailwind:
	node $(BLOWFISH)/node_modules/@tailwindcss/cli/dist/index.mjs \
	 -c $(BLOWFISH)/tailwind.config.js \
	 -i $(BLOWFISH)/assets/css/main.css \
	 -o ./assets/css/compiled/main.css \
	 --jit

# Same as `compile-tailwind`, but watch for changes and update as necessary
# (until manually stopped)
watch-tailwind:
	node $(BLOWFISH)/node_modules/@tailwindcss/cli/dist/index.mjs \
	 -c $(BLOWFISH)/tailwind.config.js \
	 -i $(BLOWFISH)/assets/css/main.css \
	 -o ./assets/css/compiled/main.css \
	 --jit -w