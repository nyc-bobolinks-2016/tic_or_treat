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
      if(this.props.outcome != 2) {
        $('.gameBoard').addClass('finished')
        $('.container').prepend("<div class='center'><a href='/games/new'>Play Again</a></div>")

        if (this.props.outcome == -1) {
          $('.container').prepend('<div class="center">You Lost!</div>')
        } else if (this.props.outcome == 0){
          $('.container').prepend('<div class="center message">You Tied!</div>')
        } else {
          $('.container').prepend('<div class="center message">You Won!</div>')
        }
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
        console.log(this.props.userId);
        console.log(typeof this.props.userId);
          $target.addClass("img-user clicked");
          if(response.winner != 'tie' && response.winner != "user" && response.winner != 'comp'){
            $("#" + response).addClass("img-comp");
          } else if (response.winner === "user") {
              $('.gameBoard').addClass("finished");
              if( this.props.userId == 1){
                $('.container').prepend("<div class='center'><a href='/users/new'>Sign up</a> or <a href='/sessions/new'>log in</a> to save this game</div>")
              }
              $('.container').prepend("<div class='center'><a href='/games/new'>Play Again</a></div>")
              $('.container').prepend('<div class="center message">You Won!</div>')
          } else if (response.winner === "comp"){
              $("#" + response.move).addClass("img-comp");
              $('.gameBoard').addClass("finished");
              if( this.props.userId == 1){
                $('.container').prepend("<div class='center'><a href='/users/new'>Sign up</a> or <a href='/sessions/new'>log in</a> to save this game</div>")
              }
              $('.container').prepend("<div class='center'><a href='/games/new'>Play Again</a></div>")
              $('.container').prepend('<div class="center message">You Lost!</div>')

              console.log("User lost")
          } else {
              $('.gameBoard').addClass("finished");
              if( this.props.userId == 1){
                $('.container').prepend("<div class='center'><a href='/users/new'>Sign up</a> or <a href='/sessions/new'>log in</a> to save this game</div>")
              }
              $('.container').prepend("<div class='center'><a href='/games/new'>Play Again</a></div>")
              $('.container').prepend('<div class="center message">You Tied!</div>')
              console.log("Game tied")
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
