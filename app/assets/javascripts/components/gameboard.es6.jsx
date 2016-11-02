class GameBoard extends React.Component {
    constructor() {
      super();
      this.state = {
        board: ''
      }
      this.handleClick = this.handleClick.bind(this)
    }

    componentDidMount(){
      this.setState({
        board: this.props.data
      })
      for(var i = 0; i < 9; i++){
        let char = this.props.data[i]
        if(char == 'X'){
          $('#' + i.toString()).addClass('img-user');
        } else if(char == 'O'){
          $('#' + i.toString()).addClass('img-comp');
        }
      }
      if(this.props.outcome != 2){
        $('.gameBoard').addClass('finished')
      }
    }

  handleClick(event){
    var boxId = $(event.target).attr('id'),
        $target = $(event.target),
        clicked = $target.attr('class').indexOf("clicked"),
        gameOver = $('.gameBoard').attr('class').indexOf("finished");

    if(clicked < 0 && gameOver < 0){
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
              $("#" + response.move).addClass("img-comp");
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
