FROM alpine:latest

# Install required packages
RUN apk add --update --no-cache git python3 py3-pip

# Clone the repository
RUN git clone https://github.com/TheCommsChannel/TC2-APRS-BBS.git

# Install Python dependencies
RUN pip install --no-cache-dir --break-system-packages -r /TC2-APRS-BBS/requirements.txt

# Copy configuration script
COPY start.sh /

# Set permissions for configuration script
RUN chmod +x /start.sh

# Define config volume
VOLUME /config

# Define working directory
WORKDIR /config

# Define the command to run
CMD ["sh", "-c", " /start.sh &&  python3 /TC2-APRS-BBS/server.py"]
