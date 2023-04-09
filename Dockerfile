# ------------------------------------------------------------------------------
# Pull base image
FROM ubuntu:jammy
MAINTAINER Brett Kuskie <fullaxx@gmail.com>

# ------------------------------------------------------------------------------
# Set environment variables
ENV DEBIAN_FRONTEND noninteractive
ENV LANG C

# ------------------------------------------------------------------------------
# Install novnc,websockify and clean up
RUN apt-get update && \
    apt-get install -y --no-install-recommends novnc websockify && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /var/tmp/* /tmp/*

# ------------------------------------------------------------------------------
# Install scripts and configuration files
COPY app/app.sh /app/
COPY noVNC/index.html /usr/share/novnc/

# ------------------------------------------------------------------------------
# Add volumes
VOLUME /cert

# ------------------------------------------------------------------------------
# Expose ports
EXPOSE 8080 8081 8082 8083

# ------------------------------------------------------------------------------
# Define default command
CMD ["/app/app.sh"]
