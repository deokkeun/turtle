const boards = document.querySelectorAll(".board");

boards.forEach((board) => {
    const addBoard = board.querySelector(".add-board");
    const editBoardTitle = board.querySelector(".edit-boardTitle");
    const editBoardTitleButton = board.querySelector(".edit-boardTitle-btn");
    const boardTitle = board.querySelector(".boardTitle");

    board.addEventListener("mouseover", function() {

        addBoard.style.visibility = "visible";
        editBoardTitle.style.visibility = "visible";
    });

    board.addEventListener("mouseout", function() {
        addBoard.style.visibility = "hidden";
        editBoardTitle.style.visibility = "hidden";
    });

    editBoardTitleButton.addEventListener("click", function() {
        boardTitle.contentEditable = true;
    });

});