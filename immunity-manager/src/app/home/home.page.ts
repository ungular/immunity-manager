import { Component } from '@angular/core';
import { Plugins } from "@capacitor/core"

const { HealthPlugin } = Plugins

@Component({
  selector: 'app-home',
  templateUrl: 'home.page.html',
  styleUrls: ['home.page.scss'],
})
export class HomePage {

  constructor() {}

  ionViewDidLoad() {
    const data = HealthPlugin.fetchActivityData().then((result) => { 
      console.log(result.value)
     });
  }
}
