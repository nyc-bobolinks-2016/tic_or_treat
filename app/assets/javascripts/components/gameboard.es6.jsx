class GameBoard extends React.Component {
    constructor() {
      super();
      this.state = {
        board: ''
      }
      this.handleClick = this.handleClick.bind(this)
    }



  handleClick(event){
    event.preventDefault();

    var boxId = $(event.target).attr('id');
    console.log(boxId)
    $.ajax({
      url: '/games/update',
      type: "patch",
      data: {game: {id: boxId}}
    }).done((response) => {
      console.log(response)
      this.setState({
        $(event.target).addClass
      })
    })
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
