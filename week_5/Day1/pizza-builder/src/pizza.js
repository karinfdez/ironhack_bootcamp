// Write your Pizza Builder JavaScript in this file.

// Iteration 2
// Set by default regular sauce and crust(Removes the gluten free one)
$( document ).ready(function() {
    $('.crust').removeClass('crust-gluten-free');
    $('.sauce').removeClass('sauce-white');
    $('.pep').toggle();
    $('.peppe').toggle();
    $('.mushrooms').toggle();
    $('.mushroom').toggle();
    $('.mush').toggle();
    $('.greenPe').toggle();
    $('.green-pepper').toggle();
    $('.whiteSau').toggle();
    $('.gluten').toggle();
    var pizza=10;
    $('strong').append(pizza);

// Iteration 1
// Add and Removes pepperonni from pizza()
$('.btn-pepperonni').on('click',function(){
     $('.pep').toggle();
     $(event.currentTarget).toggleClass('active');
     $('.peppe').toggle();
     if ($(event.currentTarget).hasClass('active')){
     	pizza--
     }
     else{
     	pizza++
     	
     }
     $('strong').text(pizza);
       
  });


// Add and Removes mushrooms from pizza()
$('.btn-mushrooms').on('click',function(){
     $('.mushroom').toggle();
     $(event.currentTarget).toggleClass('active');
     $('.mush').toggle();
     if ($(event.currentTarget).hasClass('active')){
     	pizza--
     }
     else{
     	pizza++
     	
     }
     $('strong').text(pizza);
 
  });

// Add and Removes green-pepper from pizza()
$('.btn-green-peppers').on('click',function(){
     $('.green-pepper').toggle();
     $(event.currentTarget).toggleClass('active');
     $('.greenPe').toggle();
     if ($(event.currentTarget).hasClass('active')){
     	pizza--
     }
     else{
     	pizza++
     	
     }
     $('strong').text(pizza);
  });


// Activating white sauce and gluten-free buttons
$('.btn-sauce').on('click',function(){
	$('.sauce').toggleClass('sauce-white');
	$(event.currentTarget).toggleClass('active');
	$('.whiteSau').toggle();
	 if ($(event.currentTarget).hasClass('active')){
     	pizza-=3
     }
     else{
     	pizza+=3
     	
     }
     $('strong').text(pizza);
});

$('.btn-crust').on('click',function(){
	$('.crust').toggleClass('crust-gluten-free');
	$(event.currentTarget).toggleClass('active');
	$('.gluten').toggle();
	if ($(event.currentTarget).hasClass('active')){
     	pizza-=5
     }
     else{
     	pizza+=5
     	
     }
     $('strong').text(pizza);
});
	
});

