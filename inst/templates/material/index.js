import './index.scss'

import {MDCTopAppBar} from '@material/top-app-bar';
import {MDCDrawer} from "@material/drawer";

import { select, selectAll } from "d3-selection"



const init = () => {
  const drawer = MDCDrawer.attachTo(document.querySelector('.mdc-drawer'));
  const topAppBar = MDCTopAppBar.attachTo(document.getElementById('app-bar'));
  topAppBar.setScrollTarget(document.getElementById('main-content'));
  topAppBar.listen('MDCTopAppBar:nav', () => {
    drawer.open = !drawer.open;
  });
  // TODO figure out multiple levels
  const asideList = select('aside .mdc-list')
  const tocItems = selectAll('aside #__tocwrapper li a').attr('class', 'mdc-list-item').nodes()
  tocItems.map(el => asideList.node().append(el))
  select('aside #__tocwrapper').remove()

  const figures = selectAll(".figure")
    .classed("mdc-card", true)
    .selectAll(".caption")
    .classed("demo-card__title", true)
    .classed("mdc-typography", true)
    .classed("mdc-typography--headline6", true)
}

window.select = select
window.selectAll = selectAll

window.init = init

