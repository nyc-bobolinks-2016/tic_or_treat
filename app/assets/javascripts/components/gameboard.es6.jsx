class GameBoard extends React.Component {
    constructor() {
      super();
      this.state = {
        board: ''
      }
      this.handleClick = this.handleClick.bind(this)
    }



  handleClick(event){
    var boxId = $(event.target).attr('id'),
        $target = $(event.target),
        clicked = $target.attr('class').indexOf("clicked"),
        gameOver = $('.gameBoard').attr('class').indexOf("finished");
    if(clicked <= 0 && gameOver <= 0){
      $.ajax({
        url: '/games/update',
        type: "patch",
        data: {game: {id: boxId}}
      }).done( (response) => {
        console.log('ajax worked');
          $target.addClass("img-user clicked");
          if(response != 'false' && response.winner != "user" && response.winner != 'comp'){
            $("#" + response).addClass("img-comp");
          } else if (response.winner === "user") {
              $('.gameBoard').addClass("finished");
              console.log("User won")
          } else if (response.winner === "comp"){
              $('.gameBoard').addClass("finished");
              console.log("User lost")
          }
        })
    }
  }

  render(){
    return(
      <div className="gameBoard">
        <div className="row">
          <div id="0" className="board-col" onClick={this.handleClick}>

          </div>
          <div id="1" className="board-col" onClick={this.handleClick}>

          </div>
          <div id="2" className="board-col" onClick={this.handleClick}>

          </div>
        </div>
        <div className="row">
          <div id="3" className="board-col" onClick={this.handleClick}>

          </div>
          <div id="4" className="board-col" onClick={this.handleClick}>

          </div>
          <div id="5" className="board-col" onClick={this.handleClick}>

          </div>
        </div>
        <div className="row">
          <div id="6" className="board-col" onClick={this.handleClick}>

          </div>
          <div id="7" className="board-col" onClick={this.handleClick}>

          </div>
          <div id="8" className="board-col" onClick={this.handleClick}>

          </div>
        </div>
      </div>
    )
  }
}
