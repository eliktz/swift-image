#if os(iOS) || os(OSX) || os(watchOS) || os(tvOS)
    import CoreGraphics
    import Foundation
    
    extension Image where Pixel == RGBA<UInt8> {
        private static var colorSpace: CGColorSpace {
            return CGColorSpaceCreateDeviceRGB()
        }
        
        private static var bitmapInfo: CGBitmapInfo {
            return CGBitmapInfo(rawValue: CGImageAlphaInfo.premultipliedLast.rawValue | CGBitmapInfo.byteOrder32Big.rawValue)
        }
        
        private init(width: Int, height: Int, setUp: (CGContext) -> ()) {
            let pixels: [RGBA<UInt8>] = Image.drawnPixels(
                width: width,
                height: height,
                defaultPixel: .transparent,
                colorSpace: Image<RGBA<UInt8>>.colorSpace,
                bitmapInfo: Image<RGBA<UInt8>>.bitmapInfo,
                minValue: .min,
                maxValue: .max,
                isEqual: ==,
                toSummable: Int.init,
                product: (*) as (Int, Int) -> Int,
                quotient: (/) as (Int, Int) -> Int,
                toOriginal: UInt8.init,
                setUp: setUp
            )
            
            self.init(width: width, height: height, pixels: pixels)
        }
        
        public init(cgImage: CGImage) {
            let width = cgImage.width
            let height = cgImage.height
            
            self.init(width: width, height: height, setUp: { context in
                let rect = CGRect(x: 0.0, y: 0.0, width: CGFloat(width), height: CGFloat(height))
                context.draw(cgImage, in: rect)
            })
        }
        
        public var cgImage: CGImage {
            return Image.generatedCGImage(
                image: self,
                colorSpace: Image<RGBA<UInt8>>.colorSpace,
                bitmapInfo: Image<RGBA<UInt8>>.bitmapInfo,
                maxValue: .max,
                toSummable: Int.init,
                product: (*) as (Int, Int) -> Int,
                quotient: (/) as (Int, Int) -> Int,
                toOriginal: UInt8.init
            )
        }
        
        public func resizedTo(width: Int, height: Int, interpolationQuality: CGInterpolationQuality = .default) -> Image<RGBA<UInt8>> {
            return Image(width: width, height: height) { context in
                context.interpolationQuality = interpolationQuality
                context.draw(self.cgImage, in: CGRect(x: 0.0, y: 0.0, width: CGFloat(width), height: CGFloat(height)))
            }
        }
    }
    
    extension Image where Pixel == RGBA<UInt16> {
        private static var colorSpace: CGColorSpace {
            return CGColorSpaceCreateDeviceRGB()
        }
        
        private static var bitmapInfo: CGBitmapInfo {
            return CGBitmapInfo(rawValue: CGImageAlphaInfo.premultipliedLast.rawValue | CGBitmapInfo.byteOrder32Big.rawValue)
        }
        
        private init(width: Int, height: Int, setUp: (CGContext) -> ()) {
            let pixels: [RGBA<UInt16>] = Image.drawnPixels(
                width: width,
                height: height,
                defaultPixel: .transparent,
                colorSpace: Image<RGBA<UInt16>>.colorSpace,
                bitmapInfo: Image<RGBA<UInt16>>.bitmapInfo,
                minValue: .min,
                maxValue: .max,
                isEqual: ==,
                toSummable: Int.init,
                product: (*) as (Int, Int) -> Int,
                quotient: (/) as (Int, Int) -> Int,
                toOriginal: UInt16.init,
                setUp: setUp
            )
            
            self.init(width: width, height: height, pixels: pixels)
        }
        
        public init(cgImage: CGImage) {
            let width = cgImage.width
            let height = cgImage.height
            
            self.init(width: width, height: height, setUp: { context in
                let rect = CGRect(x: 0.0, y: 0.0, width: CGFloat(width), height: CGFloat(height))
                context.draw(cgImage, in: rect)
            })
        }
        
        public var cgImage: CGImage {
            return Image.generatedCGImage(
                image: self,
                colorSpace: Image<RGBA<UInt16>>.colorSpace,
                bitmapInfo: Image<RGBA<UInt16>>.bitmapInfo,
                maxValue: .max,
                toSummable: Int.init,
                product: (*) as (Int, Int) -> Int,
                quotient: (/) as (Int, Int) -> Int,
                toOriginal: UInt16.init
            )
        }
        
        public func resizedTo(width: Int, height: Int, interpolationQuality: CGInterpolationQuality = .default) -> Image<RGBA<UInt16>> {
            return Image(width: width, height: height) { context in
                context.interpolationQuality = interpolationQuality
                context.draw(self.cgImage, in: CGRect(x: 0.0, y: 0.0, width: CGFloat(width), height: CGFloat(height)))
            }
        }
    }
    
    extension Image where Pixel == RGBA<UInt32> {
        private static var colorSpace: CGColorSpace {
            return CGColorSpaceCreateDeviceRGB()
        }
        
        private static var bitmapInfo: CGBitmapInfo {
            return CGBitmapInfo(rawValue: CGImageAlphaInfo.premultipliedLast.rawValue | CGBitmapInfo.byteOrder32Big.rawValue)
        }
        
        private init(width: Int, height: Int, setUp: (CGContext) -> ()) {
            let pixels: [RGBA<UInt32>] = Image.drawnPixels(
                width: width,
                height: height,
                defaultPixel: .transparent,
                colorSpace: Image<RGBA<UInt32>>.colorSpace,
                bitmapInfo: Image<RGBA<UInt32>>.bitmapInfo,
                minValue: .min,
                maxValue: .max,
                isEqual: ==,
                toSummable: Int64.init,
                product: (*) as (Int64, Int64) -> Int64,
                quotient: (/) as (Int64, Int64) -> Int64,
                toOriginal: UInt32.init,
                setUp: setUp
            )
            
            self.init(width: width, height: height, pixels: pixels)
        }
        
        public init(cgImage: CGImage) {
            let width = cgImage.width
            let height = cgImage.height
            
            self.init(width: width, height: height, setUp: { context in
                let rect = CGRect(x: 0.0, y: 0.0, width: CGFloat(width), height: CGFloat(height))
                context.draw(cgImage, in: rect)
            })
        }
        
        public var cgImage: CGImage {
            return Image.generatedCGImage(
                image: self,
                colorSpace: Image<RGBA<UInt32>>.colorSpace,
                bitmapInfo: Image<RGBA<UInt32>>.bitmapInfo,
                maxValue: .max,
                toSummable: Int64.init,
                product: (*) as (Int64, Int64) -> Int64,
                quotient: (/) as (Int64, Int64) -> Int64,
                toOriginal: UInt32.init
            )
        }
        
        public func resizedTo(width: Int, height: Int, interpolationQuality: CGInterpolationQuality = .default) -> Image<RGBA<UInt32>> {
            return Image(width: width, height: height) { context in
                context.interpolationQuality = interpolationQuality
                context.draw(self.cgImage, in: CGRect(x: 0.0, y: 0.0, width: CGFloat(width), height: CGFloat(height)))
            }
        }
    }
    
    extension Image where Pixel == RGBA<Float> {
        private static var colorSpace: CGColorSpace {
            return CGColorSpaceCreateDeviceRGB()
        }
        
        private static var bitmapInfo: CGBitmapInfo {
            return CGBitmapInfo(rawValue: CGImageAlphaInfo.premultipliedLast.rawValue | CGBitmapInfo.byteOrder32Big.rawValue)
        }
        
        private init(width: Int, height: Int, setUp: (CGContext) -> ()) {
            let pixels: [RGBA<UInt8>] = Image.drawnPixels(
                width: width,
                height: height,
                defaultPixel: .transparent,
                colorSpace: Image<RGBA<UInt8>>.colorSpace,
                bitmapInfo: Image<RGBA<UInt8>>.bitmapInfo,
                minValue: .min,
                maxValue: .max,
                isEqual: ==,
                toSummable: Int.init,
                product: (*) as (Int, Int) -> Int,
                quotient: (/) as (Int, Int) -> Int,
                toOriginal: UInt8.init,
                setUp: setUp
            )
            
            self.init(width: width, height: height, pixels: pixels.map { $0.map { Float($0) / 255 } })
        }
        
        public init(cgImage: CGImage) {
            let width = cgImage.width
            let height = cgImage.height
            
            self.init(width: width, height: height, setUp: { context in
                let rect = CGRect(x: 0.0, y: 0.0, width: CGFloat(width), height: CGFloat(height))
                context.draw(cgImage, in: rect)
            })
        }
        
        public var cgImage: CGImage {
            return map { $0.map { UInt8(clamp($0, lower: 0.0, upper: 1.0) * 255) } }.cgImage
        }
        
        public func resizedTo(width: Int, height: Int, interpolationQuality: CGInterpolationQuality = .default) -> Image<RGBA<Float>> {
            return Image(width: width, height: height) { context in
                context.interpolationQuality = interpolationQuality
                context.draw(self.cgImage, in: CGRect(x: 0.0, y: 0.0, width: CGFloat(width), height: CGFloat(height)))
            }
        }
    }
    
    extension Image where Pixel == RGBA<Double> {
        private static var colorSpace: CGColorSpace {
            return CGColorSpaceCreateDeviceRGB()
        }
        
        private static var bitmapInfo: CGBitmapInfo {
            return CGBitmapInfo(rawValue: CGImageAlphaInfo.premultipliedLast.rawValue | CGBitmapInfo.byteOrder32Big.rawValue)
        }
        
        private init(width: Int, height: Int, setUp: (CGContext) -> ()) {
            let pixels: [RGBA<UInt8>] = Image.drawnPixels(
                width: width,
                height: height,
                defaultPixel: .transparent,
                colorSpace: Image<RGBA<UInt8>>.colorSpace,
                bitmapInfo: Image<RGBA<UInt8>>.bitmapInfo,
                minValue: .min,
                maxValue: .max,
                isEqual: ==,
                toSummable: Int.init,
                product: (*) as (Int, Int) -> Int,
                quotient: (/) as (Int, Int) -> Int,
                toOriginal: UInt8.init,
                setUp: setUp
            )
            
            self.init(width: width, height: height, pixels: pixels.map { $0.map { Double($0) / 255 } })
        }
        
        public init(cgImage: CGImage) {
            let width = cgImage.width
            let height = cgImage.height
            
            self.init(width: width, height: height, setUp: { context in
                let rect = CGRect(x: 0.0, y: 0.0, width: CGFloat(width), height: CGFloat(height))
                context.draw(cgImage, in: rect)
            })
        }
        
        public var cgImage: CGImage {
            return map { $0.map { UInt8(clamp($0, lower: 0.0, upper: 1.0) * 255) } }.cgImage
        }
        
        public func resizedTo(width: Int, height: Int, interpolationQuality: CGInterpolationQuality = .default) -> Image<RGBA<Double>> {
            return Image(width: width, height: height) { context in
                context.interpolationQuality = interpolationQuality
                context.draw(self.cgImage, in: CGRect(x: 0.0, y: 0.0, width: CGFloat(width), height: CGFloat(height)))
            }
        }
    }
    
    extension Image where Pixel == RGBA<Bool> {
        private static var colorSpace: CGColorSpace {
            return CGColorSpaceCreateDeviceRGB()
        }
        
        private static var bitmapInfo: CGBitmapInfo {
            return CGBitmapInfo(rawValue: CGImageAlphaInfo.premultipliedLast.rawValue | CGBitmapInfo.byteOrder32Big.rawValue)
        }
        
        private init(width: Int, height: Int, setUp: (CGContext) -> ()) {
            let pixels: [RGBA<UInt8>] = Image.drawnPixels(
                width: width,
                height: height,
                defaultPixel: .transparent,
                colorSpace: Image<RGBA<UInt8>>.colorSpace,
                bitmapInfo: Image<RGBA<UInt8>>.bitmapInfo,
                minValue: .min,
                maxValue: .max,
                isEqual: ==,
                toSummable: Int.init,
                product: (*) as (Int, Int) -> Int,
                quotient: (/) as (Int, Int) -> Int,
                toOriginal: UInt8.init,
                setUp: setUp
            )
            
            self.init(width: width, height: height, pixels: pixels.map { $0.map { $0 >= 128 } })
        }
        
        public init(cgImage: CGImage) {
            let width = cgImage.width
            let height = cgImage.height
            
            self.init(width: width, height: height, setUp: { context in
                let rect = CGRect(x: 0.0, y: 0.0, width: CGFloat(width), height: CGFloat(height))
                context.draw(cgImage, in: rect)
            })
        }
        
        public var cgImage: CGImage {
            return map { $0.map { $0 ? (255 as UInt8) : (0 as UInt8) } }.cgImage
        }
        
        public func resizedTo(width: Int, height: Int, interpolationQuality: CGInterpolationQuality = .default) -> Image<RGBA<Bool>> {
            return Image(width: width, height: height) { context in
                context.interpolationQuality = interpolationQuality
                context.draw(self.cgImage, in: CGRect(x: 0.0, y: 0.0, width: CGFloat(width), height: CGFloat(height)))
            }
        }
    }
    
    extension Image where Pixel == UInt8 {
        private static var colorSpace: CGColorSpace {
            return CGColorSpaceCreateDeviceGray()
        }
        
        private static var bitmapInfo: CGBitmapInfo {
            return CGBitmapInfo()
        }
        
        private init(width: Int, height: Int, setUp: (CGContext) -> ()) {
            let pixels: [UInt8] = Image.drawnPixels(
                width: width,
                height: height,
                defaultPixel: 0,
                colorSpace: Image<UInt8>.colorSpace,
                bitmapInfo: Image<UInt8>.bitmapInfo,
                setUp: setUp
            )
            
            self.init(width: width, height: height, pixels: pixels)
        }
        
        public init(cgImage: CGImage) {
            let width = cgImage.width
            let height = cgImage.height
            
            self.init(width: width, height: height, setUp: { context in
                let rect = CGRect(x: 0.0, y: 0.0, width: CGFloat(width), height: CGFloat(height))
                context.draw(cgImage, in: rect)
            })
        }
        
        public var cgImage: CGImage {
            return Image.generatedCGImage(
                image: self,
                colorSpace: Image<UInt8>.colorSpace,
                bitmapInfo: Image<UInt8>.bitmapInfo
            )
        }
        
        public func resizedTo(width: Int, height: Int, interpolationQuality: CGInterpolationQuality = .default) -> Image<UInt8> {
            return Image(width: width, height: height) { context in
                context.interpolationQuality = interpolationQuality
                context.draw(self.cgImage, in: CGRect(x: 0.0, y: 0.0, width: CGFloat(width), height: CGFloat(height)))
            }
        }
    }
    
    extension Image where Pixel == UInt16 {
        private static var colorSpace: CGColorSpace {
            return CGColorSpaceCreateDeviceGray()
        }
        
        private static var bitmapInfo: CGBitmapInfo {
            return CGBitmapInfo()
        }
        
        private init(width: Int, height: Int, setUp: (CGContext) -> ()) {
            let pixels: [UInt16] = Image.drawnPixels(
                width: width,
                height: height,
                defaultPixel: 0,
                colorSpace: Image<UInt16>.colorSpace,
                bitmapInfo: Image<UInt16>.bitmapInfo,
                setUp: setUp
            )
            
            self.init(width: width, height: height, pixels: pixels)
        }
        
        public init(cgImage: CGImage) {
            let width = cgImage.width
            let height = cgImage.height
            
            self.init(width: width, height: height, setUp: { context in
                let rect = CGRect(x: 0.0, y: 0.0, width: CGFloat(width), height: CGFloat(height))
                context.draw(cgImage, in: rect)
            })
        }
        
        public var cgImage: CGImage {
            return Image.generatedCGImage(
                image: self,
                colorSpace: Image<UInt16>.colorSpace,
                bitmapInfo: Image<UInt16>.bitmapInfo
            )
        }
        
        public func resizedTo(width: Int, height: Int, interpolationQuality: CGInterpolationQuality = .default) -> Image<UInt16> {
            return Image(width: width, height: height) { context in
                context.interpolationQuality = interpolationQuality
                context.draw(self.cgImage, in: CGRect(x: 0.0, y: 0.0, width: CGFloat(width), height: CGFloat(height)))
            }
        }
    }
    
    extension Image where Pixel == UInt32 {
        private static var colorSpace: CGColorSpace {
            return CGColorSpaceCreateDeviceGray()
        }
        
        private static var bitmapInfo: CGBitmapInfo {
            return CGBitmapInfo()
        }
        
        private init(width: Int, height: Int, setUp: (CGContext) -> ()) {
            let pixels: [UInt32] = Image.drawnPixels(
                width: width,
                height: height,
                defaultPixel: 0,
                colorSpace: Image<UInt32>.colorSpace,
                bitmapInfo: Image<UInt32>.bitmapInfo,
                setUp: setUp
            )
            
            self.init(width: width, height: height, pixels: pixels)
        }
        
        public init(cgImage: CGImage) {
            let width = cgImage.width
            let height = cgImage.height
            
            self.init(width: width, height: height, setUp: { context in
                let rect = CGRect(x: 0.0, y: 0.0, width: CGFloat(width), height: CGFloat(height))
                context.draw(cgImage, in: rect)
            })
        }
        
        public var cgImage: CGImage {
            return Image.generatedCGImage(
                image: self,
                colorSpace: Image<UInt32>.colorSpace,
                bitmapInfo: Image<UInt32>.bitmapInfo
            )
        }
        
        public func resizedTo(width: Int, height: Int, interpolationQuality: CGInterpolationQuality = .default) -> Image<UInt32> {
            return Image(width: width, height: height) { context in
                context.interpolationQuality = interpolationQuality
                context.draw(self.cgImage, in: CGRect(x: 0.0, y: 0.0, width: CGFloat(width), height: CGFloat(height)))
            }
        }
    }
    
    extension Image where Pixel == Float {
        private static var colorSpace: CGColorSpace {
            return CGColorSpaceCreateDeviceGray()
        }
        
        private static var bitmapInfo: CGBitmapInfo {
            return CGBitmapInfo()
        }
        
        private init(width: Int, height: Int, setUp: (CGContext) -> ()) {
            let pixels: [UInt8] = Image.drawnPixels(
                width: width,
                height: height,
                defaultPixel: 0,
                colorSpace: Image<UInt8>.colorSpace,
                bitmapInfo: Image<UInt8>.bitmapInfo,
                setUp: setUp
            )
            
            self.init(width: width, height: height, pixels: pixels.map { Float($0) / 255 })
        }
        
        public init(cgImage: CGImage) {
            let width = cgImage.width
            let height = cgImage.height
            
            self.init(width: width, height: height, setUp: { context in
                let rect = CGRect(x: 0.0, y: 0.0, width: CGFloat(width), height: CGFloat(height))
                context.draw(cgImage, in: rect)
            })
        }
        
        public var cgImage: CGImage {
            return map { UInt8(clamp($0, lower: 0.0, upper: 1.0) * 255) }.cgImage
        }
        
        public func resizedTo(width: Int, height: Int, interpolationQuality: CGInterpolationQuality = .default) -> Image<Float> {
            return Image(width: width, height: height) { context in
                context.interpolationQuality = interpolationQuality
                context.draw(self.cgImage, in: CGRect(x: 0.0, y: 0.0, width: CGFloat(width), height: CGFloat(height)))
            }
        }
    }
    
    extension Image where Pixel == Double {
        private static var colorSpace: CGColorSpace {
            return CGColorSpaceCreateDeviceGray()
        }
        
        private static var bitmapInfo: CGBitmapInfo {
            return CGBitmapInfo()
        }
        
        private init(width: Int, height: Int, setUp: (CGContext) -> ()) {
            let pixels: [UInt8] = Image.drawnPixels(
                width: width,
                height: height,
                defaultPixel: 0,
                colorSpace: Image<UInt8>.colorSpace,
                bitmapInfo: Image<UInt8>.bitmapInfo,
                setUp: setUp
            )
            
            self.init(width: width, height: height, pixels: pixels.map { Double($0) / 255 })
        }
        
        public init(cgImage: CGImage) {
            let width = cgImage.width
            let height = cgImage.height
            
            self.init(width: width, height: height, setUp: { context in
                let rect = CGRect(x: 0.0, y: 0.0, width: CGFloat(width), height: CGFloat(height))
                context.draw(cgImage, in: rect)
            })
        }
        
        public var cgImage: CGImage {
            return map { UInt8(clamp($0, lower: 0.0, upper: 1.0) * 255) }.cgImage
        }
        
        public func resizedTo(width: Int, height: Int, interpolationQuality: CGInterpolationQuality = .default) -> Image<Double> {
            return Image(width: width, height: height) { context in
                context.interpolationQuality = interpolationQuality
                context.draw(self.cgImage, in: CGRect(x: 0.0, y: 0.0, width: CGFloat(width), height: CGFloat(height)))
            }
        }
    }

    extension Image where Pixel == Bool {
        private static var colorSpace: CGColorSpace {
            return CGColorSpaceCreateDeviceGray()
        }
        
        private static var bitmapInfo: CGBitmapInfo {
            return CGBitmapInfo()
        }
        
        private init(width: Int, height: Int, setUp: (CGContext) -> ()) {
            let pixels: [UInt8] = Image.drawnPixels(
                width: width,
                height: height,
                defaultPixel: 0,
                colorSpace: Image<UInt8>.colorSpace,
                bitmapInfo: Image<UInt8>.bitmapInfo,
                setUp: setUp
            )
            
            self.init(width: width, height: height, pixels: pixels.map { $0 >= 128 })
        }
        
        public init(cgImage: CGImage) {
            let width = cgImage.width
            let height = cgImage.height
            
            self.init(width: width, height: height, setUp: { context in
                let rect = CGRect(x: 0.0, y: 0.0, width: CGFloat(width), height: CGFloat(height))
                context.draw(cgImage, in: rect)
            })
        }
        
        public var cgImage: CGImage {
            return map { $0 ? 255 as UInt8 : 0 as UInt8 }.cgImage
        }
        
        public func resizedTo(width: Int, height: Int, interpolationQuality: CGInterpolationQuality = .default) -> Image<Bool> {
            return Image(width: width, height: height) { context in
                context.interpolationQuality = interpolationQuality
                context.draw(self.cgImage, in: CGRect(x: 0.0, y: 0.0, width: CGFloat(width), height: CGFloat(height)))
            }
        }
    }
#endif
