// Main Variables
let theInput = document.querySelector(".get-repos input");
let getButton = document.querySelector(".get-button");
let reposData = document.querySelector(".show-data");


getButton.onclick = function () {
  getRepos();
};

// Get Repos Function
function getRepos() {

  if (theInput.value == "") { // If Value Is Empty

    reposData.innerHTML = "<span>Please Write Github Username.</span>";

  } else {

    fetch(`https://api.github.com/users/${theInput.value}/repos`)

    .then((response) => response.json())

    .then((repositories) => {

      // Empty The Container
      reposData.innerHTML = '';

      // Loop On Repositories
      repositories.forEach(repo => {

        // Create The Main Div Element
        let mainDiv = document.createElement("div");

        // Create Repo Name Text
        let repoName = document.createTextNode(repo.name);

        // Append The Text To Main Div
        mainDiv.appendChild(repoName);

        // Create Repo URL Anchor
        let theUrl = document.createElement('a');

        // Create Repo Url Text
        let theUrlText = document.createTextNode("Visit");

        // Append The Repo Url Text To Anchor Tag
        theUrl.appendChild(theUrlText);

        // Add Thje Hypertext Reference "href"
        theUrl.href = `https://github.com/${theInput.value}/${repo.name}`;

        // Set Attribute Blank
        theUrl.setAttribute('target', '_blank');

        // Append Url Anchor To Main Div
        mainDiv.appendChild(theUrl);

        // Create Stars Count Span
        let starsSpan = document.createElement("span");

        // Create The Stars Count Text
        let starsText = document.createTextNode(`Stars ${repo.stargazers_count}`);

        // Add Stars Count Text To Stars Span
        starsSpan.appendChild(starsText);

        // Append Stars Count Span To Main Div
        mainDiv.appendChild(starsSpan);

        // Add Class On Main Div
        mainDiv.className = 'repo-box';

        // Append The Main Div To Container
        reposData.appendChild(mainDiv);

      });

    });

  }


}


// ---------------------------------------------------------------------


var data_1 = [
  { id: 1, text_1: "Chaos", text_2: "Void", father: null, color:"#FF5722" },
  { id: 2, text_1: "Tartarus", text_2: "Abyss", father: 1, color:"#FFC107" },
  { id: 3, text_1: "Gaia", text_2: "Earth", father: 1, color:"#8BC34A" },
  { id: 4, text_1: "Eros", text_2: "Desire", father: 1,  color:"#00BCD4" }];

var data_2 = [
  { id: 1, text_1: "Chaos", text_2: " Void", father: null, color:"#2196F3" },
  { id: 2, text_1: "Tartarus", text_2: "Abyss", father: 1 ,color:"#F44336"},
  { id: 3, text_1: "Gaia", text_2: "Earth", father: 1,color:"#673AB7" },
  { id: 4, text_1: "Eros", text_2: "Desire", father: 1,color:"#009688" },
  { id: 5, text_1: "Uranus", text_2: "Sky", father: 3,color:"#4CAF50" },
  { id: 6, text_1: "Ourea", text_2: "Mountains", father: 3,color:"#FF9800" }];

  var data_3 = [
  { id: 1, text_1: "Chaos", text_2: "Void", father: null, color:"#2196F3" },
  { id: 2, text_1: "Tartarus", text_2: "Abyss", father: 1 ,color:"#F44336"},
  { id: 3, text_1: "Gaia", text_2: "Earth", father: 1,color:"#673AB7" },
  { id: 4, text_1: "Eros", text_2: "Desire", father: 1,color:"#009688" },
  { id: 5, text_1: "Uranus", text_2: "Sky", father: 3,color:"#4CAF50" },
  { id: 6, text_1: "Ourea", text_2: "Mountains", father: 3,color:"#FF9800" },
  { id: 7, text_1: "Hermes", text_2: " Sky", father: 4,color:"#2196F3" },
  { id: 8, text_1: "Aphrodite", text_2: "Love", father: 4,color:"#8BC34A" },
  { id: 3.3, text_1: "Love", text_2: "Peace", father: 8,color:"#c72e99" },
  { id: 4.1, text_1: "Hope", text_2: "Life", father: 8,color:"#2eecc7" }
  ];

var myTree = Treeviz.create({
  htmlId: "tree",
  idKey: "id",
  hasFlatData: true,
  relationnalField: "father",
  hasPanAndZoom: true,
  nodeWidth:150,
  nodeHeight:70,
  mainAxisNodeSpacing:2,
  isHorizontal:true,
  renderNode: function(node) { 
  return result = "<div class='box' style='cursor:pointer;height:"+node.settings.nodeHeight+"px; width:"+node.settings.nodeWidth+"px;display:flex;flex-direction:column;justify-content:center;align-items:center;background-color:"
          +node.data.color+
        ";border-radius:5px;'><div><strong>"
    +node.data.text_1+
    "</strong></div><div>is</div><div><i>"
    +node.data.text_2+
    "</i></div></div>";
  },
  linkWidth : (nodeData)=> 5,
  linkShape:"curve",
  linkColor : (nodeData) => "#B0BEC5" ,
  onNodeClick : (nodeData) => console.log(nodeData)
});
<<<<<<< HEAD


// Display the tree based on the data
myTree.refresh(data);



var hierarchical_data_example = {
  name: "Mom",
  qty: 10,
  children: [
    { name: "Son A", qty: 3 },
    { name: "Son B", qty: 7 },
  ],
};

var myTree = Treeviz.create({
  htmlId: "tree",
  idKey: "name",
  hasFlatData: false,
  relationnalField: "children",
});

myTree.refresh(hierarchical_data_example);

myTree.refresh(data_1);
var toggle=true;
document.querySelector("#add").addEventListener("click", () => {toggle ? myTree.refresh(data_2) : myTree.refresh(data_3); toggle = false});
document.querySelector("#remove").addEventListener("click", () => myTree.refresh(data_1));

