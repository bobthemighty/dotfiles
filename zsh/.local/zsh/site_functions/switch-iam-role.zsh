function asp {
  if [[ -z "$1" ]]; then
    if [[ -z "$AWS_DEFAULT_PROFILE" ]]; then
      echo "No profile set"
    else
      asp "$AWS_DEFAULT_PROFILE"
      echo "$AWS_DEFAULT_PROFILE"
    fi
  else
    if ! fgrep -q "[profile $1]" ~/.aws/config; then
      echo "No such profile"
    else
      local access_key=$(awk "/\[$1\]/,/^\$/ { if (\$1 == \"aws_access_key_id\") { print \$3 }}" ~/.aws/credentials)

      if [[ -z "$access_key" ]]; then
        local role_arn=$(awk "/\[$1\]/,/^\$/ { if (\$1 == \"role_arn\") { print \$3 }}" ~/.aws/credentials)
        local source_profile=$(awk "/\[$1\]/,/^\$/ { if (\$1 == \"source_profile\") { print \$3 }}" ~/.aws/credentials)
        local json="$(aws sts assume-role --profile "$source_profile" --role-arn "$role_arn" --role-session-name "$1")"

        export AWS_ACCESS_KEY_ID=$(echo $json | jq -r '.Credentials.AccessKeyId')
        export AWS_SECRET_ACCESS_KEY=$(echo $json | jq -r '.Credentials.SecretAccessKey')
        export AWS_SESSION_TOKEN=$(echo $json | jq -r '.Credentials.SessionToken')
        export AWS_SECURITY_TOKEN="$AWS_SESSION_TOKEN"
      else
        export AWS_ACCESS_KEY_ID=$access_key
        export AWS_SECRET_ACCESS_KEY=$(awk "/\[$1\]/,/^\$/ { if (\$1 == \"aws_secret_access_key\") { print \$3 }}" ~/.aws/credentials)
      fi

      export AWS_DEFAULT_REGION=$(awk "/\[profile\ $1\]/,/^\$/ { if (\$1 == \"region\") { print \$3 }}" ~/.aws/config)
      export AWS_DEFAULT_PROFILE="$1"
    fi
  fi
}
