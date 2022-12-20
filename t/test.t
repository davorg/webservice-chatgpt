use Test::More;
use WebService::ChatGPT;

# Test creating a new ChatGPT object
my $chatgpt = WebService::ChatGPT->new(host => 'localhost', port => 8080);
isa_ok($chatgpt, 'WebService::ChatGPT', 'Object is a ChatGPT');

# Test sending a prompt and receiving a response
my $response = $chatgpt->send_prompt('What is your name?');
is($response, 'My name is ChatGPT.', 'Response is correct');

# Test sending an invalid prompt
eval { $chatgpt->send_prompt('') };
like($@, qr/Invalid prompt/, 'Invalid prompt error is thrown');

done_testing();
