
  document.addEventListener('DOMContentLoaded', function(){
  
                                                    
    var cy = cytoscape({                                                                                                                                                                                                                                                                        
      container: document.getElementById('cy'),
      
      layout: {
        name: 'breadthfirst',
        directed: true,
        fit: true,
        padding: 10 
      },
      
      elements: 
      		{
				nodes: [
							// L2
							{ data: { id: '1125899906842655', 'name': 'CA6-E-GCLOUD-PUB-1-L2-UP-12R19'}, classes: 'tor'},
							{ data: { id: '1125899906842654', 'name': 'CA6-E-GCLOUD-PUB-1-L2-DN-12R19'}, classes: 'tor'},

							// cnode
							{ data: { id: '1407374883553296', 'name': 'cnode11-m.t2pod1.g-pub.gov.ucloud.com'}, classes: 'cnode'},

							// platform
							//{ data: { id: '844424930131969', 'name': 'G-Cloud CloudStack'}},
							//{ data: { id: '844424930131970', 'name': 'G-Cloud OpenStack'}},

							// VM
							{ data: { id: '1688849860263943', 'name': 'Windows-Update-Server'}, classes: 'vm'},
							{ data: { id: '1688849860264254', 'name': 'r-6613-VM'}, classes: 'vm'},
							{ data: { id: '1688849860265830', 'name': 'ntbdcdata3'}, classes: 'vm'},
							{ data: { id: '1688849860267730', 'name': 'njwtest2'}, classes: 'vm'},
							{ data: { id: '1688849860267735', 'name': 'porxy'}, classes: 'vm'},
							{ data: { id: '1688849860267958', 'name': 'r-23556-VM'}, classes: 'vm'},
							{ data: { id: '1688849860268928', 'name': 'DFM-EVENT'}, classes: 'vm'},
							{ data: { id: '1688849860269416', 'name': 'ApmgDB'}, classes: 'vm'},
							{ data: { id: '1688849860269595', 'name': 'i-135-27856-VM'}, classes: 'vm'},
							{ data: { id: '1688849860269860', 'name': 'r-28241-VM'}, classes: 'vm'},
							{ data: { id: '1688849860270609', 'name': 'SolTest221115-WAFProVM'}, classes: 'vm'}
						  
						],
				 edges: [
							// L2_cnode
							{ data: { id: '2251799813686320', source: '1125899906842655', target: '1407374883553296' } },
							{ data: { id: '2251799813686520', source: '1125899906842654', target: '1407374883553296' } },
						
							// cnode_vm
							{ data: { id: '1970324836986602', source: '1407374883553296', target: '1688849860263943' } },
							{ data: { id: '1970324836986877', source: '1407374883553296', target: '1688849860264254' } },
							{ data: { id: '1970324836988251', source: '1407374883553296', target: '1688849860265830' } },
							{ data: { id: '1970324836989941', source: '1407374883553296', target: '1688849860267730' } },
							{ data: { id: '1970324836989946', source: '1407374883553296', target: '1688849860267735' } },
							{ data: { id: '1970324836990142', source: '1407374883553296', target: '1688849860267958' } },
							{ data: { id: '1970324836991034', source: '1407374883553296', target: '1688849860268928' } },
							{ data: { id: '1970324836991456', source: '1407374883553296', target: '1688849860269416' } },
							{ data: { id: '1970324836991611', source: '1407374883553296', target: '1688849860269595' } },
							{ data: { id: '1970324836991859', source: '1407374883553296', target: '1688849860269860' } },
							{ data: { id: '1970324836992522', source: '1407374883553296', target: '1688849860270609' } },
				]
			},

      style: [
        {
          selector: 'node',
          style: {
            'label': 'data(name)',
            'width': '110px',
            'height': '100px', 
            'shape': 'rectangle',
            'background-opacity': 0,
            "text-valign": "bottom",
            "text-halign": "center",
            'color': '#ffffff'
          }
        },
        {
          selector: 'edge',
          style: {
            'line-color': '#2B65EC',
            'width': 1
          }
        },
        {
          selector: '.tor',
          style: {
            'background-image': '/img/tor.png'
          }
        },
        {
          selector: '.vm',
          style: {
            'background-image': '/img/vm.png'
          }
        },
        {
          selector: '.cnode',
          style: {
            'background-image': '/img/cnode.png'
          }
        }
      ]
    });
        
      cy.fit();

      cy.on('tapend mouseout', 'node', function (e) {});
                                           
      let resizeTimer;

      window.addEventListener('resize', function () {
          this.clearTimeout(resizeTimer);
          resizeTimer = this.setTimeout(function(){
              cy.fit();
          },200);
      });
    
  });
    