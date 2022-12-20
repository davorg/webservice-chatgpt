package WebService::ChatGPT;

use Moose;
use Net::WebSocket::Client;
use Net::WebSocket::Server;

use HTTP::Async;

has host => (
  is => 'ro',
  isa => 'Str',
  required => 1,
);

has port => (
  is => 'ro',
  isa => 'Int',
  required => 1,
);

sub send_prompt {
  my ($self, $prompt) = @_;

  my $http = HTTP::Async->new;
  my $client = Net::WebSocket::Client->new(
    url => "ws://$self->{host}:$self->{port}"
  );

  $client->connect; $client->send_utf8($prompt);
  my $response = $client->recv;
  $client->disconnect;

  return $response;
}

1;
