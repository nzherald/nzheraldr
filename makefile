
all:
	cd inst/templates/material && npx parcel build index.js --no-source-maps
	R -e "devtools::install('.')"
