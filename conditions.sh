# #!/bin/bash

# NUMBER1=$1
# NUMBER2=$2

# if [ "$NUMBER1 -lt $NUMBER2" ]
# then
#     echo "$NUMBER1" is greater than "$NUMBER2"
# else
#     echo "$NUMBER2" is greater than "$NUMBER1"
# fi
############

#!/bin/bash

# check if the number is greater than 10 or not
NUMBER=$1

if [ $NUMBER -gt 10 ]
then
    echo "$NUMBER is greater than 10"
else
    echo "$NUMBER is not greater than 10"
fi