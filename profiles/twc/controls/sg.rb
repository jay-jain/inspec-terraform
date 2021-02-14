title "TWC Test SG"

# content = inspec.profile.file("attributes.json")
# params = JSON.parse(content)
# Get Values from attributes.yml
security_group_vpc_id = input(:security_group_vpc_id)
security_group_name = input(:security_group_name)
security_group_id = input(:security_group_id)
sg_id = security_group_id['value']
sg_name = security_group_name['value']
sg_vpc_id= security_group_vpc_id['value']

control "aws-security-group" do
    title "Check Security Group configuration"
    desc  "
        Check Security Group for #{sg_name}
    "
    impact 1.0
    describe aws_security_group(group_name: sg_name) do
      it                          { should exist }
      its("group_name")           { should eq "WebServerSG" }
      its('inbound_rules_count')  { should eq 4 }
      its('outbound_rules_count') { should eq 1 }
      its("vpc_id")               { should eq sg_vpc_id }
      its("group_id")             { should eq sg_id }
    end
  end

  control "Test TWC SG" do
    title "Test TWC SG"
    desc  "
        Test TWC SG 
    "
    describe aws_security_group(group_id: sg_id) do
        it { should_not allow_in(port: 22, ipv4_range: '0.0.0.0/0') }
    end

  end