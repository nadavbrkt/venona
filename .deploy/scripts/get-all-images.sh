MYDIR=$(dirname $0)
CHARTDIR="${MYDIR}/../cf-runtime"
VALUESFILE="../cf-runtime/.ci/values-ci.yaml"
OUTPUTFILE=$1
helm dependency update $CHARTDIR
helm template --values $VALUESFILE $CHARTDIR | grep -E 'image:' | awk -F ': ' '{print $2}' | tr -d '"' | uniq > $OUTPUTFILE