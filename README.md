# Exolegend2025Arena

Exolegend 2025 the arena

This is just a dockerized version of the game's arena server.

## Start the image

### Prerequisites
- 
- Docker installed on your machine.
- Docker Compose installed on your machine.
- A terminal or command prompt to run commands.
- A Git client to clone the repository (optional, you can also download the ZIP file).
- A web browser to access the arena and control interfaces.

### Clone the repository

You can clone the repository using Git or download it as a ZIP file.

### Setting up the environment

Simply run the following command:

```bash
docker compose up -d
```

## last steps

The browser will not be load utomatically...

but [arena](localhost:50004) and [control](localhost:50005) will work.

## Stopping the server
To stop the server, run the following command in the terminal:

```bash
docker compose down
```

## Updating the server
To update the server, you can pull the latest changes from the repository and then restart the server
by running the following commands:

```bash
git pull origin main
docker compose down
docker compose up -d
```

## Configuring the server

You can configure the server by editing the configuration files in the `config` directory. 
The main configuration file is `config.yaml`, where you can set various parameters such as game settings, 
player limits, and more.

## Troubleshooting

If you encounter any issues, check the following:

- Ensure Docker and Docker Compose are installed correctly.
- Check the logs for any errors by running:
- ```bash
docker compose logs
- Ensure the ports 50004 and 50005 are not being used by other applications.
- If you have issues with the browser not loading, try clearing your browser cache or using a different browser.
- If you have issues with the arena or control interfaces, check the configuration files in the `config` directory and ensure they are set up correctly.
- If you have issues with the game client connecting to the server, ensure that the client is configured to connect to the correct IP address and port.

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.

