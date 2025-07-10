
  document.addEventListener('DOMContentLoaded', function(){

    $.getJSON("JsonTest.json", function (data) {
      console.log(data);

    var cy = cytoscape({
      container: document.getElementById('cy'),
      
      layout: {
        name: 'grid',
        cols: 2,
        rows: 1
      },
      
      elements: data,
      

    //   elements: {            
    //     nodes:[
    //       { data:{ id: 'n0', parent: 'group1', label:'172.25.0.1'}, classes: 'aggregation'},
    //       { data:{ id: 'n1', parent: 'group1', label:'172.25.0.2'}, classes: 'aggregation'},
    //       { data:{ id: 'group1', label:'Aggregation'}, classes: 'non-border-group'},
    //       { data:{ id: 't1', parent: 'group2', label:'172.25.1.1'}, classes: 'tor'},
    //       { data:{ id: 't2', parent: 'group2', label:'172.25.1.2'}, classes: 'tor'},
    //       { data:{ id: 'group2', label:'ToR'}, classes: 'non-border-group'}
    //     ],
    //     edges:[
    //       { data:{ id: 'e0', source: 'n0', target: 't2'} },
    //       { data:{ id: 'e1', source: 'n1', target: 't2'} },
    //       { data:{ id: 'e2', source: 't1', target: 'n1'} }, 
    //       { data:{ id: 'e3', source: 'n0', target: 't1'} }          
    //     ]
    //   } 

      style: [
        {
          selector: 'node',
          style: {
            'label': 'data(label)',
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
          selector: ':parent',
            style: {
              'background-opacity': 0.6,
              'background-color': '#0c1350',
              'border-color': '#1f2e7a',
              'border-opacity': 1,
              'shape':'roundrectangle',
              'text-valign': 'center',
              'text-halign': 'left',
              'text-margin-x': -80,
              'font-size': '35%',
              'font-weight': 'bold',
              'color': '#bce0fe',
              'padding': '20px'
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
          selector: '.aggregation',
          style: {
            'background-image': 'img/aggregation_.png'
          }
        },
        {
          selector: '.tor',
          style: {
            'background-image': 'img/tor.png'
          }
        },
        {
          selector: '.vm',
          style: {
            'background-image': './img/vm.png'
          }
        },
        {
          selector: '.vmRed',
          style: {
            'background-image': 'img/vm2.png'
          }
        },
        {
          selector: '.cnode',
          style: {
            'background-image': 'img/cnode.png'
          }
        },
        {
          selector: '.cnodeRed',
          style: {
            'background-image': 'img/cnode2.png'
          }
        },
        {
          selector: '.storage',
          style: {
            'background-image': 'img/storage.png'
          }
        },
        {
          selector: '.non-border-group',
          style: {
            'background-opacity': 0,
            'border-width': '0'
          }
        }
      ]
    });
   

    cy.add({ group: 'nodes', data:{ id: 'group3', label:'VM'}});    

    for(var i=0;i<30;i++){

      var vmClass = 'vm';

      if(i==12 || i==13 || i==14){
        vmClass = 'vmRed';
      }

      cy.add({
        group: 'nodes', 
        data: { id: 'vm'+(i+1), 
                parent: 'group3', 
                label:'110.255.15.'+(100+i)
              },
        classes: vmClass, 
        position: { x:((i%10)*130), 
                    y:+((i/10)>=1 ? parseInt(i/10)*120:0)
                  }
      });
    }
    
    cy.add({ group: 'nodes', data:{ id: 'group4', label:'CNode'}});    

    for(var i=0;i<14;i++){
      
      var cnClass = 'cnode';

      if(i==5){
        cnClass = 'cnodeRed';
      }

      cy.add({
        group: 'nodes', 
        data: { id: 'cnode'+(i+1), 
                parent: 'group4', 
                label:'110.255.20.'+(100+i)
              }, 
        classes: cnClass, 
        position: { x:((i%10)*130), 
                    y:+((i/10)>=1 ? parseInt(i/10)*120:0)
                  }
      });
    }

    cy.add({ group: 'nodes', data:{ id: 'group5', label:'Storage'}, classes: 'non-border-group'});    

    for(var i=0;i<8;i++){
      cy.add({
        group: 'nodes', 
        data: { id: 'storage'+(i+1), 
                parent: 'group5', 
                label:'110.255.30.'+(100+i)
              }, 
        classes: 'storage', 
        position: { x:((i%10)*130), 
                    y:+((i/10)>=1 ? parseInt(i/10)*120:0)
                  }
      });
    }
    
    cy.add([
        { group:'edges', data:{ id: 'e4', source: 't1', target: 'cnode1'} },
        { group:'edges', data:{ id: 'e5', source: 't1', target: 'cnode2'} },
        { group:'edges', data:{ id: 'e6', source: 't1', target: 'cnode3'} }, 
        { group:'edges', data:{ id: 'e7', source: 't1', target: 'cnode4'} },
		{ group:'edges', data:{ id: 'e8', source: 't1', target: 'cnode5'} },
        { group:'edges', data:{ id: 'e9', source: 't1', target: 'cnode6'} },
        { group:'edges', data:{ id: 'e10', source: 't1', target: 'cnode7'} }, 
        { group:'edges', data:{ id: 'e11', source: 't1', target: 'cnode8'} },
		{ group:'edges', data:{ id: 'e12', source: 't1', target: 'cnode9'} },
        { group:'edges', data:{ id: 'e13', source: 't1', target: 'cnode10'} },
        { group:'edges', data:{ id: 'e14', source: 't1', target: 'cnode11'} }, 
        { group:'edges', data:{ id: 'e15', source: 't1', target: 'cnode12'} },
		{ group:'edges', data:{ id: 'e16', source: 't1', target: 'cnode13'} },
        { group:'edges', data:{ id: 'e17', source: 't1', target: 'cnode14'} },
        { group:'edges', data:{ id: 'e18', source: 't2', target: 'cnode1'} },
        { group:'edges', data:{ id: 'e19', source: 't2', target: 'cnode2'} },
        { group:'edges', data:{ id: 'e20', source: 't2', target: 'cnode3'} }, 
        { group:'edges', data:{ id: 'e21', source: 't2', target: 'cnode4'} },
		{ group:'edges', data:{ id: 'e22', source: 't2', target: 'cnode5'} },
        { group:'edges', data:{ id: 'e23', source: 't2', target: 'cnode6'} },
        { group:'edges', data:{ id: 'e24', source: 't2', target: 'cnode7'} }, 
        { group:'edges', data:{ id: 'e25', source: 't2', target: 'cnode8'} },
		{ group:'edges', data:{ id: 'e26', source: 't2', target: 'cnode9'} },
        { group:'edges', data:{ id: 'e27', source: 't2', target: 'cnode10'} },
        { group:'edges', data:{ id: 'e28', source: 't2', target: 'cnode11'} }, 
        { group:'edges', data:{ id: 'e29', source: 't2', target: 'cnode12'} },
		{ group:'edges', data:{ id: 'e30', source: 't2', target: 'cnode13'} },
        { group:'edges', data:{ id: 'e31', source: 't2', target: 'cnode14'} },
        { group:'edges', data:{ id: 'e32', source: 'cnode1', target: 'storage1'} }, 
        { group:'edges', data:{ id: 'e33', source: 'cnode2', target: 'storage1'} },
		{ group:'edges', data:{ id: 'e34', source: 'cnode3', target: 'storage2'} },
        { group:'edges', data:{ id: 'e35', source: 'cnode4', target: 'storage2'} },
        { group:'edges', data:{ id: 'e36', source: 'cnode5', target: 'storage2'} }, 
        { group:'edges', data:{ id: 'e37', source: 'cnode6', target: 'storage3'} },
		{ group:'edges', data:{ id: 'e38', source: 'cnode7', target: 'storage3'} },
        { group:'edges', data:{ id: 'e39', source: 'cnode8', target: 'storage4'} },
		{ group:'edges', data:{ id: 'e40', source: 'cnode9', target: 'storage5'} },
        { group:'edges', data:{ id: 'e41', source: 'cnode10', target: 'storage5'} },
        { group:'edges', data:{ id: 'e42', source: 'cnode11', target: 'storage5'} },
        { group:'edges', data:{ id: 'e43', source: 'cnode12', target: 'storage6'} },
        { group:'edges', data:{ id: 'e44', source: 'cnode13', target: 'storage7'} },
        { group:'edges', data:{ id: 'e45', source: 'cnode14', target: 'storage8'} }
      ]);

      const layout = cy.layout({
        name: 'preset',
        padding: 5
      });
  
      layout.run();
            
      cy.$('#group1').position({
        y: 50
      });
      cy.$('#n0').position({
        x: 100
      });
      cy.$('#n1').position({
        x: 300
      });
      cy.$('#group2').position({
        y: 200
      });
      cy.$('#t1').position({
        x: 100
      });
      cy.$('#t2').position({
        x: 300
      });
      cy.$('#group3').position({
        x: cy.$('#group2').position('x'),
        y: cy.$('#group2').position('y')+300
      });
      cy.$('#group4').position({
        x: cy.$('#group2').position('x'),
        y: cy.$('#group3').position('y')+350
      });
      cy.$('#group5').position({
        x: cy.$('#group2').position('x'),
        y: cy.$('#group4').position('y')+200
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
    }
    );
    
  });
    