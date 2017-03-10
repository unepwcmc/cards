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
    var inAnimationClass    = "animated fadeIn",
        outAnimationClass   = "animated fadeOut",
        shakeAnimationClass = "animated rubberBand";

    this.channel.on("new-card", payload => {
      var $card = $(`[data-card-id='${payload.id}']`);

      $card.addClass(outAnimationClass).one("webkitAnimationEnd", () => {
        $card.html(payload.card);

        $card
          .css("opacity", 0.95)
          .removeClass(outAnimationClass)
          .addClass(inAnimationClass)
          .one("webkitAnimationEnd", () => $card.removeClass(inAnimationClass));
      });
    });

    this.channel.on("reload", payload => {
      window.reload();
    });

    this.channel.on("shake", payload => {
      var $card = $(`[data-card-id='${payload.id}']`);

      $card.addClass(shakeAnimationClass).css("z-index", 99999).one("webkitAnimationEnd", () => {
        $card.removeClass(shakeAnimationClass).css("z-index", 1);
      });
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
