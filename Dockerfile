FROM linuxserver/wireguard:version-v1.0.20210914

RUN sed -i '/^wg-quick up wg0/a \\nif [ "true" == "$LOG" ]; then \n  echo "**** Logging activated ****" >> /proc/1/fd/1 # redirect output to stdout of PID 1 (needed to send logs to docker log after docker daemon restart) \n  /app/logging.sh \nfi' /etc/services.d/wireguard/run
COPY logging.sh /app/logging.sh
