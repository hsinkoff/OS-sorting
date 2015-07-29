
<body>
<table> 
  <thead> 
    <tr> 
      <th>Name</th> 
      <th>Status</th> 
    </tr> 
  </thead> 
  <tbody id = "namesTable"> 
    <tr> 
      <td id = "person1">Doe, John</td> 
      <td>Approved</td> 
    </tr> 
  </tbody> 
</table> 

<script type="text/javascript">
function addSortedRow(lastName, firstName, status) {
    var names = [];
    var people = document.querySelectorAll('[id^="person"');
    for (i = 0; i < people.length; i++){
        names.push(people[i].innerText);
    }
    names.push(lastName + ", " + firstName);
    names.sort();
    var location = names.lastIndexOf(lastName + ", " + firstName)
    var table = document.getElementById('namesTable');
    var row = table.insertRow(location);
    var cell1 = row.insertCell(0);
    var cell2 = row.insertCell(1);
    cell1.setAttribute('id', "person" + (names.length));
    cell1.innerHTML = lastName + ", " + firstName;
    cell2.innerHTML = status;
    var request;
    if (window.XMLHttpRequest) {
        request = new XMLHttpRequest();
    }
    else (window.ActiveXObject) {
        request = new ActiveXObject("Microsoft.XMLHTTP");
    } 
    request.open("POST", "/member/save", true);
    request.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
    request.send("firstName=" + firstName + "&lastName=" + lastName + "&status=" + status);
}

addSortedRow("Smith", "Mike", "active");
addSortedRow("Andrews", "Abe", "retired");
addSortedRow("Andrews", "Mike", "active");
addSortedRow("Jones", "Jack", "active");
addSortedRow("Jones", "Abby", "retired");

</script>

</body>
