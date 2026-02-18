import consumer from "channels/consumer"

consumer.subscriptions.create("NotificationChannel", {
  connected() {
    console.log("Connected to NotificationChannel")
  },

  disconnected() {
  },

  received(data) {
    const notif = document.getElementById("notification-area")
    if (notif) {
      notif.innerHTML = `<div style="background:#27ae60; color:white; padding:10px 15px; border-radius:4px; margin-bottom:10px;">
        🔔 ${data.message}
      </div>`
      setTimeout(() => { notif.innerHTML = "" }, 5000)
    }
  }
})