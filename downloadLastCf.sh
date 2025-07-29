 #!/bin/bash

 URL="http://vocab.nerc.ac.uk/collection/P07/current/get"

 FILE="ontology_p07.rdf"

 
# Download the RDF file using wget
wget -q -O $FILE $URL

# Confirm download
echo "Downloaded $FILE"