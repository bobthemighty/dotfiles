status is-login; and pyenv init --path | source
status is-interactive; and pyenv init - | source
starship init fish | source

if status is-interactive

    set -gx CRE_BOBG 705323255085
    set -gx CRE_PLANTDATA 871776601617
    set -gx CRE_PROD 001359105437
    set -gx CRE_TEST 070527404083
    set -gx CRE_ECR 845045975379
    set -gx CRE_DNS 024784938875
    set -gx CRE_SSO 127213296783
    set -gx CRE_STACKSETS 060388563467

  cd $HOME/code/carbo
end
