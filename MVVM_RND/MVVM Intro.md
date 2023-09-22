#  MVVM in iOS Swift



Components Overview and their roles

# View Controller: 
        It only performs things related to UI — Show/get information. Part of the view layer
        

# View Model: 
        It receives information from VC, handles all this information, and sends it back to VC.


# Model: 
        This is only your model, nothing much here. It’s the same model as in MVC. It is used by VM and updates whenever VM sends new updates 





func abc (par1: int) -> int {
}

(int) -> Void


var abc: (() -> void) = {}
var abc: ((Int) -> ()) = {
    _ in
}


var abc: ((Int) -> Void) = {
   a in
}



