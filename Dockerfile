FROM ubuntu:20.04

RUN	apt-get update \
	&& apt-get install -y --no-install-recommends \
		samba \
		smbclient \
		dumb-init \
	&& adduser --no-create-home --disabled-password --disabled-login --gecos "" testuser \
	&& (echo "testpassword"; echo "testpassword") | smbpasswd -s -a testuser \
	&& mkdir /testshare \
	&& chown testuser:testuser /testshare \
	&& rm /etc/samba/smb.conf \
	&& rm -rf /var/lib/apt/lists/*

COPY smb.conf /etc/samba/

EXPOSE 445

HEALTHCHECK --interval=50ms --retries=200 CMD smbclient -L \\localhost -U % -m SMB3

ENTRYPOINT ["/usr/bin/dumb-init", "-v", "--"]
CMD ["/usr/sbin/smbd", "-FS", "--no-process-group"]
