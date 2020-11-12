# create a directory history_<sensor_name> 
SENSOR_NAME=$1
DIFF_DIR="history"
mkdir -p $DIFF_DIR
if [[ -f "$DIFF_DIR/${SENSOR_NAME}" ]]
then
  rm $DIFF_DIR/${SENSOR_NAME}*
fi
git log --pretty="%h" -- $SENSOR_NAME | while read commit
do
  git checkout $commit -- $SENSOR_NAME
  version=$(jq -r '.version' < $SENSOR_NAME)
  diffFilename=${SENSOR_NAME}_${version}
  jq '.' < $SENSOR_NAME > ${DIFF_DIR}/${diffFilename}
  jq -r '.script' < $SENSOR_NAME > ${DIFF_DIR}/${diffFilename}.js
done
git checkout HEAD -- $SENSOR_NAME