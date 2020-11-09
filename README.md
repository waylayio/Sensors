# Waylay Sensor Repository

With just a few lines of javascript you can connect additional software systems or applications to the waylay platform and immediately use these capabilities in your logic. 
Version management ensures that you can roll-out updated sensors in a structured way.
 


### Tools:
* [export plug history](https://gist.github.com/plankthom/585efe6958f67519f0a5909ebd4f8831): shell script to export the history of a Sensor/Actuator, as json (metadata) and javascript (script) that can be inspected with diff-tools.

## Contributing

When contributing to this repository, please first discuss the change you wish to make via an issue before making a pull request.
Pushing changes directly to the master branch without a review is not allowed. 

Please note we have some guidelines, please follow these when editing or creating Sensors in this repository.

### Code guidelines

#### Fetching API Keys
Do not hardcode references to API keys in `globalSettings` in the plug code. 
The preferred way to fetch API keys is to have them as a property, so the user can fill them in using declarative bindings.

#### Do not use injected waylayUtil functions
These functions will soon be deprecated, so we can't use them in the Sensor code anymore. 
All functionality that these functions provide should be directly available in the injected `options` object.

#### Do not use the injected packages by the old sandbox
The old sandbox injects a list of packages ([see docs](https://docs.waylay.io/plugins/sensors-and-actuators/#sandbox)).
It is forbidden to use these packages, instead add packages as dependency in require them in your code. 
This allows for control over what version of the package is used and also makes the Sensor code more understandable.
**One exception to this rule is the use of the injected Waylay-js package.**

#### Naming plugs
Give plugs a clear descriptive name using camelCase. 
Words like ‘sensor’, ‘plug’, ‘actuator’ or ‘waylay’ should not be used in the name.

### Naming states
The naming of possible Sensor states should follow these rules:
* State should start with a capital letter
* If the state consists of multiple words they should be written separately and every word should start with a capital letter.
 
#### Code syntax and Linting
When writing plugs, please use ES6 syntax features or above. 
Plug code should always be linted according to [standardjs](https://standardjs.com/) guidelines.

#### Prefered packages
For some functionality we have preferred packages:
* Requests: [Axios](https://www.npmjs.com/package/axios)
* Templating: [handlebars](https://www.npmjs.com/package/handlebars)
* Time: [moment](https://www.npmjs.com/package/moment)

#### Storing state
For some usecases it's needed to have the state of the previous sensor execution.
Do not use rawData this, instead use `internalState` (see [bitflip.json](./bitflip.json) for an example).


### Pull Request Process

1. Make changes to the plugs on the [https://library.waylay.io](https://library.waylay.io) tenant.
2. Use a linter to format the code you wrote.
3. Save the plug and increment the version accordingly. (Do not forget to update the documentation!)
4. Download the plug json file.
5. Create a new branch of this repository.
6. Add the plug json file to the branch.
7. Update the plug-integration-tests: [https://github.com/waylayio/plug-integration-tests](https://github.com/waylayio/plug-integration-tests)
8. Provide proof of the tests passing for the updated/created plugs.
9. You may merge the Pull Request in once you have the sign-off of an other developer. 