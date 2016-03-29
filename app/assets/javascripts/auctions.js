$(document).ready(function(){

  $(document).on("click", "#datepicker", function(){
    $("#datepicker").datepicker({dateFormat:"yyyy-mm-dd"});
  });

  $(".new_bid").on("submit", function(){
    $.ajax({
      url:"http://localhost:3000/auctions/",
      method: "GET",
      error: function(){
        alert("Bid failed");
      },
      success: function(){
        alert("Bid succeeded!");
      }
    }); // End of ajax
  }); //End of new bid

}); // End of document ready
