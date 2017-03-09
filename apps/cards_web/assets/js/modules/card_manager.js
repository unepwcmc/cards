import {Socket} from "phoenix";

export default class CardManager {
  constructor () {
    this.startSocket();
    this.joinChannel();

    this.addEventListeners();
    this.startCardRotation();
  }


  startSocket () {
    this.socket = new Socket("/socket", {params: {token: window.userToken}});
    this.socket.connect();
  }


  joinChannel () {
    this.channel = this.socket.channel(`cards:${Date.now()}`, {});

    this.channel.join()
      .receive("ok", resp => console.log("Joined successfully", resp))
      .receive("error", resp => console.log("Unable to join", resp));
  }


  addEventListeners () {
    this.channel.on("new-card", payload => {
      var $card = $(`[data-card-id='${payload.id}']`);
      var $cardContainer = $card.parent(".c-card");

      $cardContainer.addClass("animated fadeOut");

      $cardContainer.one("webkitAnimationEnd", () => {
        $card.html(payload.card);
        $cardContainer.css("opacity", 0.9);
        $cardContainer.removeClass("animated fadeOut");
        $cardContainer.addClass("animated fadeIn");
      });
    });

    this.channel.on("reload", payload => {
      window.reload();
    });
  }


  startCardRotation () {
    $("[data-card-id]").each((i, card) => {
      var $card = $(card);
      var startInterval = () => setInterval(() => {
        this.askForCard($card);
      }, 60000);

      this.askForCard($card);
      setTimeout(startInterval, 10000*(i+1));
    });
  }

  askForCard ($card) {
    this.channel.push("ask-new-card", {id: $card.data("card-id")});
  }
}
