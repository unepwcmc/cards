import {Socket} from "phoenix";
import Appsignal from "../cards/appsignal";

export default class CardManager {
  constructor () {
    this.startSocket();
    this.joinChannel();

    this.addEventListeners();
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
        this.loadSpecialCards($card);

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


  loadSpecialCards ($card) {
    if($card.find("[data-appsignal-container]").length > 0) {
      new Appsignal($card);
    }
  }
}
