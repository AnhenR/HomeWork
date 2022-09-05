//
//  ViewController.swift
//  Json
//
//  Created by user on 2.08.22.
//

import UIKit

struct Some: Decodable {
    let name: String
    let license: String
    let type: String
    let description: String
    let autoload: Autoload
    let require: Require
    let requireDev: RequireDev
    let repositories: [Repositories]
    let scripts: Scripts
    let config: Config
    let extra: Extra
    
    enum CodingKeys: String, CodingKey {
        case name, license, type, description, autoload, require, repositories, scripts, config, extra
        case requireDev = "require-dev"
    }
}

struct Autoload: Decodable {
    let psr0: Psr0
    let files: [String]
    let psr4: Psr4
    
    enum CodingKeys: String, CodingKey {
        case files
        case psr0 = "psr-0"
        case psr4 = "psr-4"
    }
}

struct Psr0: Decodable {
    let a: String
    
    enum CodingKeys: String, CodingKey {
        case a = ""
    }
}

struct Psr4: Decodable {
    let brickMath: String
    let cron: String
    let illuminateBus: String
    let illuminateCache: String
    let illuminateContainer: String
    let illuminateContracts: String
    let illuminateConsole: [String]
    let illuminateConsoleScheduling: [String]
    let illuminateEvents: String
    let illuminateDatabase: String
    let illuminateFoundation: String
    let illuminatePipeline: String
    let illuminateQueue: String
    let illuminateRedis: String
    let illuminateSupport: [String]
    let illuminateSupportTraits: [String]
    let psrContainer: String
    let ramseyCollection: String
    let ramseyUuid: String
    
    enum CodingKeys: String, CodingKey {
        case brickMath = "Brick\\Math\\"
        case cron = "Cron\\"
        case illuminateBus = "Illuminate\\Bus\\"
        case illuminateCache = "Illuminate\\Cache\\"
        case illuminateContainer = "Illuminate\\Container\\"
        case illuminateContracts = "Illuminate\\Contracts\\"
        case illuminateConsole = "Illuminate\\Console\\"
        case illuminateConsoleScheduling = "Illuminate\\Console\\Scheduling\\"
        case illuminateEvents = "Illuminate\\Events\\"
        case illuminateDatabase = "Illuminate\\Database\\"
        case illuminateFoundation = "Illuminate\\Foundation\\"
        case illuminatePipeline = "Illuminate\\Pipeline\\"
        case illuminateQueue = "Illuminate\\Queue\\"
        case illuminateRedis = "Illuminate\\Redis\\"
        case illuminateSupport = "Illuminate\\Support\\"
        case illuminateSupportTraits = "Illuminate\\Support\\Traits\\"
        case psrContainer = "Psr\\Container\\"
        case ramseyCollection = "Ramsey\\Collection\\"
        case ramseyUuid = "Ramsey\\Uuid\\"
    }
}

struct Require: Decodable {
    let php: String
    let extZendOpcache: String
    let extZip: String
    let extJson: String
    let extPdo: String
    let extRedis: String
    let extOpenssl: String
    let extPcntl: String
    let symfonySymfony: String
    let symfonyAsseticBundle: String
    let symfonyProcess: String
    let symfonyMonologBundle: String
    let symfonySwiftmailerBundle: String
    let symfonyPolyfillPhp73: String
    let symfonyPolyfillPhp74: String
    let symfonyPolyfillPhp80: String
    let symfonyPolyfillPhp81: String
    let doctrineDoctrineBundle: String
    let doctrineDoctrineFixturesBundle: String
    let doctrineDoctrineMigrationsBundle: String
    let doctrineLexer: String
    let doctrineMigrations: String
    let doctrineOrm: String
    let twigExtensions: String
    let sensioDistributionBundle: String
    let sensioFrameworkExtraBundle: String
    let sensioGeneratorBundle: String
    let incenteevComposerParameterHandler: String
    let jmsDiExtraBundle: String
    let avalanche123ImagineBundle: String
    let gargronFileupload: String
    let friendsofsymfonyJsroutingBundle: String
    let friendsofsymfonyRestBundle: String
    let friendsofsymfonyUserBundle: String
    let jmsSerializerBundle: String
    let gedmoDoctrineExtensions: String
    let stofDoctrineExtensionsBundle: String
    let knplabsKnpPaginatorBundle: String
    let knplabsKnpMenu: String
    let knplabsKnpMenuBundle: String
    let knplabsKnpSnappyBundle: String
    let knplabsKnpGaufretteBundle: String
    let lrotherfieldForm: String
    let stfalconTinymceBundle: String
    let liipFunctionalTestBundle: String
    let jmsSecurityExtraBundle: String
    let candyChatXmppPrebindPhp: String
    let egeloenCkeditorBundle: String
    let heliosAgFmElfinderBundle: String
    let cbodenRatchet: String
    let oroDoctrineExtensions: String
    let reactZmq: String
    let ocramiusProxyManager: String
    let guzzlehttpGuzzle: String
    let mockeryMockery: String
    let guzzleGuzzle: String
    let willdurandJsTranslationBundle: String
    let robertotruToInlineStyleEmailBundle: String
    let cmfcmfOpenweathermapPhpApi: String
    let kachkaevAssetsVersionBundle: String
    let beberleiDoctrineextensions: String
    let boxSpout: String
    let sncRedisBundle: String
    let predisPredis: String
    let phpseclibPhpseclib: String
    let psrLog: String
    let johngroggIcsParser: String
    let urbanplumBmp: String
    let voryxThruway: String
    let rguedesPdfmerger: String
    let thruwayPawlTransport: String
    let phpAmqplibPhpAmqplib: String
    let nesbotCarbon: String
    
    enum CodingKeys: String, CodingKey {
        case php
        case extZendOpcache = "ext-zend-opcache"
        case extZip = "ext-zip"
        case extJson = "ext-json"
        case extPdo = "ext-pdo"
        case extRedis = "ext-redis"
        case extOpenssl = "ext-openssl"
        case extPcntl =  "ext-pcntl"
        case symfonySymfony = "symfony/symfony"
        case symfonyAsseticBundle = "symfony/assetic-bundle"
        case symfonyProcess = "symfony/process"
        case symfonyMonologBundle = "symfony/monolog-bundle"
        case symfonySwiftmailerBundle = "symfony/swiftmailer-bundle"
        case symfonyPolyfillPhp73 = "symfony/polyfill-php73"
        case symfonyPolyfillPhp74 = "symfony/polyfill-php74"
        case symfonyPolyfillPhp80 = "symfony/polyfill-php80"
        case symfonyPolyfillPhp81 = "symfony/polyfill-php81"
        case doctrineDoctrineBundle = "doctrine/doctrine-bundle"
        case doctrineDoctrineFixturesBundle = "doctrine/doctrine-fixtures-bundle"
        case doctrineDoctrineMigrationsBundle = "doctrine/doctrine-migrations-bundle"
        case doctrineLexer = "doctrine/lexer"
        case doctrineMigrations = "doctrine/migrations"
        case doctrineOrm = "doctrine/orm"
        case twigExtensions =  "twig/extensions"
        case sensioDistributionBundle = "sensio/distribution-bundle"
        case sensioFrameworkExtraBundle =  "sensio/framework-extra-bundle"
        case sensioGeneratorBundle = "sensio/generator-bundle"
        case incenteevComposerParameterHandler = "incenteev/composer-parameter-handler"
        case jmsDiExtraBundle = "jms/di-extra-bundle"
        case avalanche123ImagineBundle = "avalanche123/imagine-bundle"
        case gargronFileupload =  "gargron/fileupload"
        case friendsofsymfonyJsroutingBundle = "friendsofsymfony/jsrouting-bundle"
        case friendsofsymfonyRestBundle =  "friendsofsymfony/rest-bundle"
        case friendsofsymfonyUserBundle = "friendsofsymfony/user-bundle"
        case jmsSerializerBundle = "jms/serializer-bundle"
        case gedmoDoctrineExtensions = "gedmo/doctrine-extensions"
        case stofDoctrineExtensionsBundle = "stof/doctrine-extensions-bundle"
        case knplabsKnpPaginatorBundle = "knplabs/knp-paginator-bundle"
        case knplabsKnpMenu = "knplabs/knp-menu"
        case knplabsKnpMenuBundle = "knplabs/knp-menu-bundle"
        case knplabsKnpSnappyBundle = "knplabs/knp-snappy-bundle"
        case knplabsKnpGaufretteBundle = "knplabs/knp-gaufrette-bundle"
        case lrotherfieldForm = "lrotherfield/form"
        case stfalconTinymceBundle = "stfalcon/tinymce-bundle"
        case liipFunctionalTestBundle =  "liip/functional-test-bundle"
        case jmsSecurityExtraBundle =  "jms/security-extra-bundle"
        case candyChatXmppPrebindPhp = "candy-chat/xmpp-prebind-php"
        case egeloenCkeditorBundle = "egeloen/ckeditor-bundle"
        case heliosAgFmElfinderBundle = "helios-ag/fm-elfinder-bundle"
        case cbodenRatchet = "cboden/ratchet"
        case oroDoctrineExtensions = "oro/doctrine-extensions"
        case reactZmq = "react/zmq"
        case ocramiusProxyManager =  "ocramius/proxy-manager"
        case guzzlehttpGuzzle = "guzzlehttp/guzzle"
        case mockeryMockery = "mockery/mockery"
        case guzzleGuzzle = "guzzle/guzzle"
        case willdurandJsTranslationBundle = "willdurand/js-translation-bundle"
        case robertotruToInlineStyleEmailBundle = "robertotru/to-inline-style-email-bundle"
        case cmfcmfOpenweathermapPhpApi = "cmfcmf/openweathermap-php-api"
        case kachkaevAssetsVersionBundle = "kachkaev/assets-version-bundle"
        case beberleiDoctrineextensions = "beberlei/doctrineextensions"
        case boxSpout = "box/spout"
        case sncRedisBundle = "snc/redis-bundle"
        case predisPredis = "predis/predis"
        case phpseclibPhpseclib = "phpseclib/phpseclib"
        case psrLog = "psr/log"
        case johngroggIcsParser = "johngrogg/ics-parser"
        case urbanplumBmp =  "urbanplum/bmp"
        case voryxThruway = "voryx/thruway"
        case rguedesPdfmerger = "rguedes/pdfmerger"
        case thruwayPawlTransport = "thruway/pawl-transport"
        case phpAmqplibPhpAmqplib = "php-amqplib/php-amqplib"
        case nesbotCarbon = "nesbot/carbon"
    }
}

struct RequireDev: Decodable {
    let phpspecPhpspec: String
    let behatBehat: String
    let behatSymfony2Extension: String
    let behatMink: String
    let behatMinkExtension: String
    let behatMinkBrowserkitDriver: String
    let behatMinkGoutteDriver: String
    let behatMinkSelenium2Driver: String
    let phpunitPhpunit: String
    
    enum CodingKeys: String, CodingKey {
        case phpspecPhpspec = "phpspec/phpspec"
        case behatBehat = "behat/behat"
        case behatSymfony2Extension = "behat/symfony2-extension"
        case behatMink = "behat/mink"
        case behatMinkExtension = "behat/mink-extension"
        case behatMinkBrowserkitDriver = "behat/mink-browserkit-driver"
        case behatMinkGoutteDriver = "behat/mink-goutte-driver"
        case behatMinkSelenium2Driver = "behat/mink-selenium2-driver"
        case phpunitPhpunit = "phpunit/phpunit"
    }
}

struct Repositories: Decodable {
    let type: String
    let package: Package
}

struct Package: Decodable {
    let version: String
    let name: String
    let source : Source
    let dist: Dist
}

struct Source: Decodable {
    let url: String
    let type: String
    let reference: String
}

struct Dist: Decodable{
    let url: String
    let type: String
}

struct Scripts: Decodable {
    let buildCarameters: [String]
    let composerStaticInstall: [String]
    let preAutoloadDump: [String]
    let postInstallCmd: [String]
    let postUpdateCmd: [String]
    
    enum CodingKeys: String, CodingKey {
        case buildCarameters = "build-parameters"
        case composerStaticInstall = "composer-static-install"
        case preAutoloadDump = "pre-autoload-dump"
        case postInstallCmd = "post-install-cmd"
        case postUpdateCmd = "post-update-cmd"
    }
}

struct Config: Decodable {
    let binDir: String
    let allowPlugins: AllowPlugins
    
    enum CodingKeys: String, CodingKey {
        case binDir = "bin-dir"
        case allowPlugins = "allow-plugins"
    }
}

struct AllowPlugins: Decodable {
    let raulfraileLadybugInstaller: Bool
    let kylekatarnlsUpdateHelper: Bool
    
    enum CodingKeys: String, CodingKey {
        case raulfraileLadybugInstaller = "raulfraile/ladybug-installer"
        case kylekatarnlsUpdateHelper = "kylekatarnls/update-helper"
    }
}

struct Extra: Decodable {
    let symfonyAppDir: String
    let symfonyWebDir: String
    let incenteevParameters: IncenteevParameters
    let branchAlias: BranchAlias
    
    enum CodingKeys: String, CodingKey {
        case symfonyAppDir = "symfony-app-dir"
        case symfonyWebDir = "symfony-web-dir"
        case incenteevParameters = "incenteev-parameters"
        case branchAlias = "branch-alias"
    }
}

struct IncenteevParameters: Decodable {
    let file: String
}

struct BranchAlias: Decodable{
    let devMaster: String
    
    enum CodingKeys: String, CodingKey {
        case devMaster = "dev-master"
    }
}

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let jsonData = readLocalFile() else { return }
        let decoder = JSONDecoder()
        guard let some = try? decoder.decode(Some.self, from: jsonData) else { return }
        print(some)
    }
    
    private func readLocalFile() -> Data? {
        do {
            if let bundlePath = Bundle.main.path(forResource: "test", ofType: "json"),
               let jsonData = try String(contentsOfFile: bundlePath).data(using: .utf8) {
                return jsonData
            }
        } catch {
            print(error)
        }
        return nil
    }
}

