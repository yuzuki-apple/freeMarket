$(function(){

function firstOption(ymd){$(ymd).append($('<option>').attr({value:'-'}).text('--'));}
function daysInMonth(year,month,day){
  if(year!='-'&&month!='-'){
    $('[id="day"]').empty();
    days=new Date(year,month,0).getDate();
    for(let i=0;i<days+1;i++){
      if(i==0){
        firstOption('[id="day"]');
      }else{
        $('[id="day"]').append($('<option>').attr({value:('00'+i).slice(-2)}).text(i));
      }
    }
    if($('[id="day"]')[0].length-1>=Number(day)){
      $('[id="day"]').val(day);
      firstOptionDisabled($($('[id="day"]')[0].firstChild));
      return day
    }else{
      $('[id="day"]').val('-');
      return day='-'
    }
  }else{
    return day
  }
}
function firstOptionDisabled(ymd){ymd.prop('disabled',true);}
function birthdayValue(year,month,day){$('[id="birthday"]').val(year+month+day);}

let now = new Date();
let thisYear=now.getFullYear();





for(let i=thisYear;i>=thisYear-100;i--){
  if(i===thisYear){
    firstOption('[id="year"]');
  }else{
    $('[id="year"]').append($('<option>').attr({value:i+1}).text(i+1));
  }
}

for(let i=0;i<13;i++){
  if(i===0){
    firstOption('[id="month"]');
  }else{
    $('[id="month"]').append($('<option>').attr({value:('00'+i).slice(-2)}).text(i));
  }
}

firstOption('[id="day"]');





$('[id="year"]').change(function(){
  let year=$(this).val();
  let month=$('[id="month"]').val();
  let day=$('[id="day"]').val();
  day=daysInMonth(year,month,day);
  firstOptionDisabled($(this.firstChild));
  console.log(day)
  birthdayValue(year,month,day);
});

$('[id="month"]').change(function(){
  let year=$('[id="year"]').val();
  let month=$(this).val();
  let day=$('[id="day"]').val();
  day=daysInMonth(year,month,day);
  firstOptionDisabled($(this.firstChild));
  birthdayValue(year,month,day);
});

$('[id="day"]').change(function(){
  let year=$('[id="year"]').val();
  let month=$('[id="month"]').val();
  let day=$(this).val();
  firstOptionDisabled($(this.firstChild));
  birthdayValue(year,month,day);
});

},false);