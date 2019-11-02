groupmod -g ${GROUP_ID} build
usermod -u ${USER_ID} -g ${GROUP_ID} build
export DISPLAY=$DISPLAY
export SSH_AUTH_SOCK=$SSH_AUTH_SOCK
#su --whitelist-environment=DISPLAY,SSH_AUTH_SOCK -l build /home/build/sdk/$@
su -l build -c "DISPLAY=$DISPLAY SSH_AUTH_SOCK=$SSH_AUTH_SOCK /home/build/sdk/$@"