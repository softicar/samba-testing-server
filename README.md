# SoftiCAR Samba Testing Server

A [Docker](https://www.docker.com/) image of a simple [Samba](https://www.samba.org/) server for unit tests in other [SoftiCAR](https://github.com/softicar) repositories.

## 1 Main Features

- Provide an SMB share to which a single user has full access.
- Integrated health check to avoid a race between SMB server startup and incoming connections.

## 2 Usage

The recommended way to run this image is:
```
docker run -dit --rm softicar/samba-testing-server
```

As soon as the container has reached healthy state, the share can be accessed via:
- Share: `testshare`
- User: `testuser`
- Password: `testpassword`
- Workgroup: `WORKGROUP`

Use an SMB 2+ client to connect to the server. Connections via SMB 1 will **not** work.

## 3 Building and Development

To build this image, use:
```
docker build -t softicar/samba-testing-server .
```

## 4 Releases and Upgrading

So far, we do not create explicit releases for this project. The `main` branch is assumed to be constantly stable.

Images are available on [DockerHub](https://hub.docker.com/r/softicar/samba-testing-server).

## 5 Contributing

Please read the [contribution guidelines](CONTRIBUTING.md) for this repository and keep our [code of conduct](CODE_OF_CONDUCT.md) in mind.
