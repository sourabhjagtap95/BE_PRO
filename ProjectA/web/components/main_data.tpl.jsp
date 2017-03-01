
<!-- Slider  -->
<my-sidenav></my-sidenav>


<!-- Main Body -->

    <div layout="column" class="relative" layout-fill role="main">

        <!-- Add button -->

      <md-button class="md-fab md-fab-bottom-right" aria-label="Add" ng-click="showPrompt()">
        <ng-md-icon icon="add"></ng-md-icon>
      </md-button>

    <!-- Delete Button -->

        <md-button class="md-fab md-primary md-fab-bottom-left" 
            title="Delete" 
            ng-click="showConfirm($event)">
            <ng-md-icon icon="delete"></ng-md-icon>
        </md-button>

      <md-toolbar ng-show="!showSearch">
        <div class="md-toolbar-tools">
          <md-button ng-click="toggleSidenav('left')" class="md-primary md-raised" aria-label="Menu">
            <ng-md-icon icon="menu"></ng-md-icon>
          </md-button>
          <h3>
            B.E Final Year Project (2017)
          </h3>
          <span flex></span>
          <md-button aria-label="Search" ng-click="showSearch = !showSearch">
            <ng-md-icon icon="search"></ng-md-icon>
          </md-button>
          <md-button aria-label="Open Settings" ng-click="showListBottomSheet($event)">
            <ng-md-icon icon="more_vert"></ng-md-icon>
          </md-button>
        </div>
        <md-tabs md-stretch-tabs class="md-primary" md-selected="data.selectedIndex">
          <md-tab id="tab1" aria-controls="tab1-content">
            IPv4 Data
          </md-tab>
          <md-tab id="tab2" aria-controls="tab2-content">
            IPv6 Data
          </md-tab>
        </md-tabs>
      </md-toolbar>
      <md-toolbar class="md-hue-1" ng-show="showSearch">
        <div class="md-toolbar-tools">
          <md-button ng-click="showSearch = !showSearch" aria-label="Back">
            <ng-md-icon icon="arrow_back"></ng-md-icon>
          </md-button>
          <h3 flex="10">
            Back
          </h3>
          <md-input-container md-theme="input" flex>
            <label>&nbsp;</label>
            <input ng-model="search.who" placeholder="enter search">
          </md-input-container>
          <md-button aria-label="Search" ng-click="showSearch = !showSearch">
            <ng-md-icon icon="search"></ng-md-icon>
          </md-button>
          <md-button aria-label="Open Settings" ng-click="showListBottomSheet($event)">
            <ng-md-icon icon="more_vert"></ng-md-icon>
          </md-button>
        </div>
       
      </md-toolbar>
      <md-content flex md-scroll-y>
        <ui-view layout="column" layout-fill layout-padding>
          <div class="inset" hide-sm></div>
            <ng-switch on="data.selectedIndex" class="tabpanel-container">
              <div class="container-fluid">
    <div class="row">
        <div class="col-md-10 col-md-offset-1">
            <div class="panel panel-default panel-table">
                <div class="panel-heading">
                    <div class="row">
                        <div class="col col-xs-6">
                            <h3 class="panel-title">Data</h3>
                        </div>

                    </div>
                </div>
                <div class="panel-body">
                    <div>
                        <div>
                            <div class="dropdown" id="dropdown_selection">
                                <md-button class="md-primary md-raised dropdown-toggle" type="button"
                                           data-toggle="dropdown">Select the version
                                    <span class="caret"></span>
                                </md-button>
                                <ul class="dropdown-menu">
                                    <!-- <div>
                                        <span ng-bind="data"></span>
                                    </div> -->
                                    <li>
                                        <md-button
                                                class="md-default md-raised"
                                                style="margin-left:35px;"
                                                ng-click="modifyJSON(); IPv4 = true">IPv4
                                        </md-button>
                                    </li>

                                    <li class="divider"></li>
                                    <li>
                                        <md-button class="md-default md-raised" style="margin-left:35px;"
                                                   ng-click="loadIPv6()">IPv6
                                        </md-button>
                                    </li>
                                </ul>
                            </div>
                      

                            <!-- Searching -->

                            <md-button
                                ng-click="toggleSearch()"
                                style="float:right"
                                class="md-primary md-raised md-fab">
                            <ng-md-icon icon="search"></ng-md-icon>
                            </md-button>
                            
                            <!-- </div> -->
                        </div>
                    </div>

                    <!-- Searching IPv4 Data     -->
                    <search-ipv4-data></search-ipv4-data>

                    <!-- Adding the data  -->
                    <add-ipv4-data></add-ipv4-data>


                    <!-- Table for IPv4 Data-->
                    <ipv4-table></ipv4-table>

                </div>
                <!-- <div class="panel-footer">
                    <div class="row">
                        <md-button class="md-fab md-mini md-primary" ng-click="limit = limit + 5" style="float:right;">
                            <span class="caret"></span></md-button>
                    </div>
                </div> -->
            </div>
        </div>
    </div>
</div>
              <div role="tabpanel"
                   id="tab2-content"
                   aria-labelledby="tab2"
                   ng-switch-when="1"
                   md-swipe-left="next()"
                   md-swipe-right="previous()" 
                   layout="row" layout-align="center center">
                  <md-card flex-gt-sm="90" flex-gt-md="80">
                    <md-card-content>
                      <h2>Favorites</h2>
                    </md-card-content>
                  </md-card>
              </div>
              
          </ng-switch>
          
        </ui-view>
      </md-content>
    </div>