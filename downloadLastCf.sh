 #!/bin/bash

 URL="http://vocab.nerc.ac.uk/collection/P07/current/get"

 FILE="ontology_p07.rdf"
 HASH_FILE="last_hash.txt"

 
# Download the RDF file using wget
wget -q -O $FILE $URL

# Get the current hash of the RDF file
CURRENT_HASH=$(md5sum $FILE | awk '{ print $1 }')

# Check if the hash file exists
if [ ! -f $HASH_FILE ]; then
  echo "First time setup, saving current hash."
  echo $CURRENT_HASH > $HASH_FILE
  exit 0
fi

# Read the last known hash
LAST_HASH=$(cat $HASH_FILE)

# Compare the current hash with the last known hash
if [ "$CURRENT_HASH" != "$LAST_HASH" ]; then
  echo "File has changed! Proceeding with further steps..."
  # Save the new hash
  echo $CURRENT_HASH > $HASH_FILE
else
  echo "No changes detected."
fi      














# Confirm download
echo "Downloaded $FILE"  
 
