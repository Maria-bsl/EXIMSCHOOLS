<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Dashboard_Old.aspx.cs" MasterPageFile="~/Head_Faci.Master" Inherits="Schools.Facili.Dashboard_Old" %>

<%@ MasterType VirtualPath="~/Head_Faci.master" %>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
  <style>
    .app-toggle,
    .sidebar {
      display: none !important;
      pointer-events: none;
    }

    .app-logo .brand-logo,
    .app-logo__toggle-btn {
      width: 75px;
    }

    .app-logo__toggle-btn{
      padding: 0 .25em;
    }

    .app-main {
      padding-left: 0 !important;
    }
  </style>
  <nav class="d-none" aria-label="Page breadcrumb">
    <ol class="breadcrumb mb-1 bg-white py-1 border">
      <li class="breadcrumb-item active">Home</li>
    </ol>
  </nav>

  

  <div class="row mx-n10px">
    <!-- Setup -->
    <div class="col-md-2 col-sm-4 col-6 pb-3">
      <a href="TaI5tH" class="module-link mx-n10px">
        <div class="card shadow">
          <span class="card-span">
            <i class="fas fa-cog fa-3x card-icon text-center txt-white"></i>
          </span>
          <div class="card-body p-0">
            <p class="module-title card-text m-0 text-center">Setup</p>
          </div>
        </div>
      </a>
    </div>

    <!-- Fees -->
    <div class="col-md-2 col-sm-4 col-6 pb-3">
      <a href="sIBEGy" class="module-link mx-n10px">
        <div class="card shadow ">
          <span class="card-span">
            <i class="fas fa-money-bill  fa-3x card-icon text-center txt-red"></i>
          </span>
          <div class="card-body p-0">
            <p class="module-title card-text m-0 text-center">Fees</p>
          </div>
        </div>
      </a>
    </div>

    <!-- Transport -->
    <div class="col-md-2 col-sm-4 col-6 pb-3">
      <a href="amf100" class="module-link mx-n10px">
        <div class="card shadow ">
          <span class="card-span">
            <i class="fas fa-bus fa-3x card-icon text-center txt-yellow"></i>
          </span>
          <div class="card-body p-0">
            <p class="module-title card-text m-0 text-center">Transport</p>
          </div>
        </div>
      </a>
    </div>

    <!-- Library -->
    <div class="col-md-2 col-sm-4 col-6 pb-3">
      <a href="amf107" class="module-link mx-n10px">
        <div class="card shadow ">
          <span class="card-span">
            <i class="fas fa-book fa-3x card-icon text-center txt-blue"></i>
          </span>
          <div class="card-body p-0">
            <p class="module-title card-text m-0 text-center">Library</p>
          </div>
        </div>
      </a>
    </div>

    <!-- Reports -->
    <div class="col-md-2 col-sm-4 col-6 pb-3">
      <a href="Rzo3i0" class="module-link mx-n10px">
        <div class="card shadow ">
          <span class="card-span">
            <i class="fas fa-chart-area fa-3x card-icon text-center txt-green"></i>
          </span>
          <div class="card-body p-0">
            <p class="module-title card-text m-0 text-center">Reports</p>
          </div>
        </div>
      </a>
    </div>

    <!-- Audit Trail -->
    <div class="col-md-2 col-sm-4 col-6 pb-3">
      <a href="VtfEIe" class="module-link mx-n10px flex-grow-1">
        <div class="card shadow ">
          <span class="card-span">
            <i class="fas fa-user-clock fa-3x card-icon text-center txt-spec"></i>
          </span>
          <div class="card-body p-0">
            <p class="module-title card-text m-0 text-center">Audit Trail
            </p>
          </div>
        </div>
      </a>
    </div>
  </div>

  <div class="school-summary">
    <div class="d-flex">
      <h2 class="h5 font-weight-bold">Summary</h2>
      <div class="hr-top mt-3"></div>
    </div>

    <div class="row mx-n10px">
      <div class="col-md-12 col-sm-12">
        <div class="row">
          <div class="col-12 col-md-auto mb-2">
            <div class="card mx-n10px shadow-lg h-100">
              <div class="card-body py-3">
                <h6 class="card-title text-normal mb-0">Sample Data</h6>
                <hr class="my-1">
                <div class="ds-files d-inline-flex flex-column">
                  <asp:LinkButton CssClass="p-1 links mb-1" runat="server" ID="lnkDPolice" CausesValidation="false"
          OnClick="lnkStu_Click"><i class="far fa-file-excel"></i> Student Registration Sample Data</asp:LinkButton>

        <asp:LinkButton CssClass="p-1 links" runat="server" ID="lnkDTanesco" CausesValidation="false"
          OnClick="lnkFee_Click"><i class="far fa-file-excel"></i> Student Fee Sample Data</asp:LinkButton>
                  <asp:LinkButton CssClass="p-1 links" runat="server" ID="LinkButton1" CausesValidation="false"
          OnClick="lnkBook_Click"><i class="far fa-file-excel"></i> Books Sample Data</asp:LinkButton>
                </div>
              </div>
            </div>
          </div>
          <div class="col">
            <div class="row h-100">
              <div class="col-sm-4 col-md-4 mb-2">
                <div class="card school-details-card mx-n10px shadow-lg h-100">
                  <div class="card-body">
                    <div class="row h-100">
                      <div class="col-auto col-sm-12 col-xl-auto">
                        <span class="d-block text-center">
                          <i class="fas fa-users txt-green"></i>
                        </span>
                        <p class="card-text text-center">Students
                        </p>
                      </div>
                      <div class="col col-md-12">
                        <span class="h1 d-block m-0 school-count"><%= scount %></span>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
              <div class="col-sm-4 col-md-4 mb-2">
                <div class="card school-details-card mx-n10px shadow-lg h-100">
                  <div class="card-body">
                    <div class="row h-100">
                      <div class="col-auto col-sm-12 col-xl-auto">
                        <span class="d-block text-center">
                          <i class="fa fa-users txt-blue"></i>
                        </span>
                        <p class="card-text text-center">Teachers
                        </p>
                      </div>
                      <div class="col col-md-12">
                        <span class="h1 d-block m-0 school-count"><%= tcount %></span>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
              <div class="col-sm-4 col-md-4 mb-2">
                <div class="card school-details-card mx-n10px shadow-lg h-100 last-school-details-card">
                  <div class="card-body">
                    <div class="row h-100">
                      <div class="col-auto col-sm-12 col-xl-auto">
                        <span class="d-block text-center">
                          <i class="fas fa-money-bill-alt txt-red"></i>
                        </span>
                        <p class="card-text text-center">Collections
                        </p>
                      </div>
                      <div class="col col-md-12">
                        <span class="h1 d-block m-0 school-count collection-card">
                          <span class="small">TZS</span>
                          <%= tsum %></span>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
      <div class="col-md-6 col-sm-12 pb-2">
        <div class="card school-calendar mx-n10px">
          <div class="card-body py-2">
            <div id='calendar'></div>
          </div>
        </div>
      </div>
      <div class="col-md-6 col-sm-12 pb-2">
        <div class="card school-details-card mx-n10px collection-chart shadow-lg">
          <div class="card-body p-0">
            <canvas id="feesCollections"></canvas>
          </div>
        </div>
      </div>
    </div>

  </div>
    <script type="text/javascript">
        $(document).ready(function () {
            // Font family defaults in ChartJs
            Chart.defaults.global.defaultFontFamily = "-apple-system,BlinkMacSystemFont,'Segoe UI',Roboto,'Helvetica Neue',Arial,'Noto Sans',sans-serif,'Apple Color Emoji','Segoe UI Emoji','Segoe UI Symbol','Noto Color Emoji'";

            Chart.defaults.global.defaultFontColor = "#343a40";

            var feesCollection = document.getElementById('feesCollections');

            // Exception Handling
            if (feesCollection) {
                feesCollection.getContext('2d');
                var myChart = new Chart(feesCollection, {
                    type: 'bar',
                    data: {
                        labels: [<%=feet%>],
                        datasets: [{
                            label: 'Collections in TZS',
                            data: [<%=feec%>],
                            backgroundColor: [
                                'rgba(255, 99, 132, 0.75)',
                                'rgba(54, 162, 235, 0.75)',
                                'rgba(255, 206, 86, 0.75)',
                                'rgba(75, 192, 192, 0.75)',
                                'rgba(153, 102, 255, 0.75)',
                                'rgba(255, 159, 64, 0.75)'
                            ],
                            borderColor: [
                                'rgba(255, 99, 132, 1)',
                                'rgba(54, 162, 235, 1)',
                                'rgba(255, 206, 86, 1)',
                                'rgba(75, 192, 192, 1)',
                                'rgba(153, 102, 255, 1)',
                                'rgba(255, 159, 64, 1)'
                            ],
                            borderWidth: 1
                        }]
                    },
                    options: {
                        tooltips: {
                            callbacks: {
                                label: function (tooltipItem, data) {
                                    return 'TZS ' + numeral(tooltipItem.yLabel).format('0,0');
                                }
                            }
                        },
                        title: {
                            display: true,
                            text: 'Collections',
                            fontStyle: "bold",
                            // fontStyle: "normal",
                            fontSize: 24,
                        },
                        scales: {
                            yAxes: [{
                                scaleLabel: {
                                    display: true,
                                    labelString: 'Amount',
                                    fontSize: 16,
                                    fontStyle: "bold",
                                },
                                ticks: {
                                    beginAtZero: true,

                                    // Include a dollar sign in the ticks
                                    callback: function (value) {
                                        // return 'TZS ' + value;
                                        // return 'TZS ' + new Intl.NumberFormat().format(value);
                                        return 'TZS ' + numeral(value).format('0,0');
                                    }
                                }
                            }],
                            xAxes: [{
                                scaleLabel: {
                                    display: true,
                                    labelString: 'Collection Type',
                                    fontSize: 16,
                                    // defaultFontColor: 'black',
                                    fontStyle: "bold",
                                    // defaultFontFamily: "Segoe UI Semibold",
                                },
                                maxBarThickness: 70,
                            }]
                        },
                        legend: {
                            display: false,
                        },
                        responsive: true,
                        maintainAspectRatio: false

                    }
                });
            }
        })
        
    </script>


</asp:Content>