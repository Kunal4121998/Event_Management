/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


function phonenumber(inputtxt)
{
  var phoneno = /^\d{10}$/;
  if(inputtxt.value.match(phoneno))
  {
               document.getElementById("myCheck").checked = true;

      return true;
  }
  else
  {
      
         document.getElementById("myCheck").checked = false;
     alert("Not a valid Phone Number");
   
 

     return false;
  }
  }