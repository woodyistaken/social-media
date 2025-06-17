import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets=["followButton","acceptButton"]
  follow(){
    if(this.followButtonTarget.textContent.trim()=="Follow"){
      this.followButtonTarget.textContent="Pending"
    }
    else{
      this.followButtonTarget.textContent="Follow"
    }
  }
  accept(){
    if(this.acceptButtonTarget.textContent.trim()=="Accept"){
      this.acceptButtonTarget.textContent="Accepted"
    }
    else{
      this.acceptButtonTarget.textContent="No Request"
    }
  }

}
