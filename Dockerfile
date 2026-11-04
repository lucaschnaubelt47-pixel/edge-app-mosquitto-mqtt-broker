# IXON SecureEdge Pro - Mosquitto MQTT Broker
# Benutzeranmeldung beim Containerstart

FROM eclipse-mosquitto:2.0

# Broker-Konfiguration uebernehmen
COPY mosquitto.conf /mosquitto/config/mosquitto.conf

# MQTT-Port
EXPOSE 1883

# Benutzerdatei beim Start erzeugen
# Zugangsdaten kommen aus Container-Umgebungsvariablen
CMD ["sh", "-ec", "test -n \"$MQTT_USERNAME\" && test -n \"$MQTT_PASSWORD\" || { echo 'MQTT-Zugangsdaten fehlen'; exit 1; }; mosquitto_passwd -b -c /mosquitto/config/passwordfile \"$MQTT_USERNAME\" \"$MQTT_PASSWORD\"; unset MQTT_PASSWORD; exec mosquitto -c /mosquitto/config/mosquitto.conf"]

