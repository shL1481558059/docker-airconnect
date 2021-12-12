FROM lsiobase/ubuntu:bionic

# Adding environment variable for binary download
ENV ARCH_VAR=x86-64

# Add Supervisor
RUN apt-get update && apt-get install -y \
    supervisor \
    wget \
    libssl1.0.0 \
    libssl-dev
COPY root/ /

# Grab latest version of the app
RUN wget -O /bin/airupnp-$ARCH_VAR https://raw.githubusercontent.com/philippe44/AirConnect/master/bin/airupnp-$ARCH_VAR \
    && chmod +x /bin/airupnp-$ARCH_VAR \
    && wget -O /bin/aircast-$ARCH_VAR https://raw.githubusercontent.com/philippe44/AirConnect/master/bin/aircast-$ARCH_VAR \
    && chmod +x /bin/aircast-$ARCH_VAR